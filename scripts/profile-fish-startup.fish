#!/usr/bin/env fish
#
# profile fish shell startup and print a per-tool breakdown.
#
# usage:
#   scripts/profile-fish-startup.fish [label]
#
# label is an optional name for the snapshot (default "latest"). the raw
# `fish --profile-startup` output is saved to /tmp/fish-startup-<label>.prof
# so you can keep before/after snapshots and diff them:
#
#   scripts/profile-fish-startup.fish before
#   # ...make a config change...
#   scripts/profile-fish-startup.fish after
#
# bars are scaled relative to the slowest tool, so use them for relative
# weight not absolute ms. the profiler TOTAL runs higher than real wall-clock
# because profiling adds per-line overhead; trust the warm wall-clock section
# at the bottom for actual speed.

set -l label latest
if test -n "$argv[1]"
    set label $argv[1]
end
set -l prof /tmp/fish-startup-$label.prof

echo "Profiling a fresh interactive fish startup → $prof"
fish --profile-startup $prof -i -c exit 2>/dev/null

# per-tool aggregated bar chart.
# profile columns are whitespace-aligned: <self_us> <sum_us> <arrow> <command...>
# classify each line by which tool's command it owns. mise is checked first so
# its PATH lines that mention "homebrew" still count as mise, not brew.
awk '
$1 ~ /^-?[0-9]+$/ {
    t = $1 + 0
    if ($0 ~ /mise/)          mise  += t
    else if ($0 ~ /shellenv/) brew  += t
    else if ($0 ~ /starship/) star  += t
    else if ($0 ~ /direnv/)   dir   += t
    else if ($0 ~ /zoxide/)   zox   += t
    else                      other += t
    total += t
}
END {
    max = mise
    if (brew  > max) max = brew
    if (star  > max) max = star
    if (dir   > max) max = dir
    if (zox   > max) max = zox
    if (other > max) max = other
    if (max <= 0) max = 1
    scale = 38.0 / max

    print ""
    print "fish startup self-time by tool (profiler us)"
    print "------------------------------------------------------------"
    show("mise (activate+hook-env+completion)", mise,  scale)
    show("brew shellenv",                       brew,  scale)
    show("starship init",                       star,  scale)
    show("direnv hook",                         dir,   scale)
    show("zoxide init",                         zox,   scale)
    show("everything else",                     other, scale)
    print "------------------------------------------------------------"
    printf "%-40s %6.1f ms\n", "TOTAL (profiler sum)", total / 1000
}
function show(label, v, sc,    n, i, b) {
    n = int(v * sc); if (n < 0) n = 0
    b = ""; for (i = 0; i < n; i++) b = b "#"
    printf "%-40s %6.1f ms  %s\n", label, v / 1000, b
}
' $prof

# slowest individual lines.
echo
echo "Top 12 slowest individual lines (self ms):"
sort -rn $prof | awk '
$1 ~ /^-?[0-9]+$/ {
    cmd = ""
    for (i = 4; i <= NF; i++) cmd = cmd (i > 4 ? " " : "") $i
    if (length(cmd) > 64) cmd = substr(cmd, 1, 61) "..."
    printf "%8.1f ms  %s\n", $1 / 1000, cmd
}' | head -12

# warm wall-clock (the number to trust).
echo
echo "Warm wall-clock startup:"
if type -q hyperfine
    hyperfine --warmup 3 --shell=none fish -i -c exit
else
    echo "  (install hyperfine for clean stats: mise use -g hyperfine)"
    for i in 1 2 3 4 5
        begin
            /usr/bin/time -p fish -i -c exit
        end 2>&1 | grep real | string replace 'real' '  run'
    end
end
