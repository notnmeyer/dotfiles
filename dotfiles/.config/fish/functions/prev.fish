function prev --description "access portions of the previous command via positional arg"
    if test (count $argv) -eq 0
        echo "usage: prev <position>"
        return 1
    end

    set cmd (string split " " -- (history | head -n1))

    if test (count $cmd) -ge $argv[1]
        echo $cmd[$argv[1]]
    else
        echo "error: command does not have that many arguments"
        return 1
    end
end
