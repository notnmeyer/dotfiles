function j --description 'pick a job with fzf; enter=fg, ctrl+b=bg'
    set -l sel (jobs | fzf --expect=enter,ctrl-b \
        --header="pick a job to resume: <enter> fg · <ctrl-b> bg" --header-first)
    test (count $sel) -ge 2; or return # cancelled / no selection

    set -l key $sel[1] # key pressed (from --expect)
    set -l line $sel[2] # the picked job line
    set -l job (string split -f1 \t -- $line) # job number = first column

    switch $key
        case ctrl-b
            bg %$job
        case '*'
            fg %$job
    end
end
