#
# ask a short question with claude -p
# usage:
#   ask <question>
#   cmd | ask <question>   (piped stdin as context)
#
# inspired by https://github.com/mariocesar/dotfiles/blob/main/common/.local/bin/ask
#
function ask
    set -l question "$argv"

    if test -z (string trim -- "$question")
        echo "usage: ask <question>   |   cmd | ask <question>" >&2
        return 2
    end

    set -l context
    if not isatty stdin
        read --null context
        set context (string trim --right --chars \n -- $context | string collect)
    end

    if test -n "$context"
        set question (printf '%s\n\n```\n%s\n```' "$question" "$context" | string collect)
    end

    set -l os
    if test -r /etc/os-release
        set -l pretty (string match -rg '^PRETTY_NAME="?([^"]*)"?$' </etc/os-release)
        set -l id_like (string match -rg '^ID_LIKE="?([^"]*)"?$' </etc/os-release)
        set os "$pretty"
        test -n "$id_like"; and set os "$os ($id_like-based)"
        test -n "$os"; or set os (uname -s)
    else if test (uname -s) = Darwin
        set os "macOS (darwin"(uname -r)")"
    else
        set os (uname -s)
    end

    set -l environment "os: $os
arch: "(uname -m)"
shell: fish
user: $USER on $hostname
cwd: $PWD
now: "(date '+%Y-%m-%d %H:%M %Z')

    set -l system_prompt "You answer short questions.
Respond in the same language as the user's question.
Prioritize correctness over completeness.
Give the direct answer first.
Include exact commands or code when useful.
Mention only caveats that can materially change the answer.
Never invent commands, flags, APIs, or facts; if uncertain, say so.
Do not restate the question or add filler.
Keep the answer concise unless more detail is necessary.

Environment — the machine the user is asking from.
Use it only when it changes the answer; ignore it otherwise.
Prefer this OS's package manager and tooling in command answers.

$environment"

    claude -p \
        --model haiku \
        --effort low \
        --tools "WebSearch,WebFetch" \
        --no-session-persistence \
        --system-prompt "$system_prompt" \
        "$question" </dev/null
end
