#
# create a tunnel using tuns.sh
# usage:
#   tunnel --name <tunnel-name> --from <port> --to <port>
# 
function tunnel
    set -l name ""
    set -l from_port ""
    set -l to_port ""

    while test (count $argv) -gt 0
        switch $argv[1]
            case --name
                set name $argv[2]
                set argv $argv[3..-1]
            case --from
                set from_port $argv[2]
                set argv $argv[3..-1]
            case --to
                set to_port $argv[2]
                set argv $argv[3..-1]
            case '*'
                echo "Unknown option: $argv[1]"
                return 1
        end
    end

    if test -z "$name"
        echo "Error: --name is required"
        return 1
    end

    if test -z "$from_port"
        echo "Error: --from is required"
        return 1
    end

    if test -z "$to_port"
        echo "Error: --to is required"
        return 1
    end

    # create the tunnel
    ssh -R $name:$to_port:localhost:$from_port tuns.sh
end
