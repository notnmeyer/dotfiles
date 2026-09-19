function __expand_to_daylog_append --description "expand a leading dash into a quoted daylog entry"
    set -l text (string replace --regex '^-\s*' '' -- $argv[1])
    if test -n "$text"
        set text "$text "
    end
    echo "daylog -a \"$text%\""
end
