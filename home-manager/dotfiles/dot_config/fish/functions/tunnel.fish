#
# create a tunnel using tuns.sh
# usage:
#   tunnel <tunnel-name> --from=<port> --to=<port>
#
function tunnel
    set -l name ""
    set -l from_port ""
    set -l to_port ""

    if test (count $argv) -eq 0
        echo "Error: tunnel name is required"
        return 1
    end

    set name $argv[1]
    set argv $argv[2..-1]

    while test (count $argv) -gt 0
        switch $argv[1]
            case '--from=*'
                set from_port (string split --max 1 -- '=' $argv[1])[2]
                set argv $argv[2..-1]
            case '--to=*'
                set to_port (string split --max 1 -- '=' $argv[1])[2]
                set argv $argv[2..-1]
            case '*'
                echo "Unknown option: $argv[1]"
                return 1
        end
    end

    if test -z "$from_port"
        echo "Error: --from=<port> is required"
        return 1
    end

    if test -z "$to_port"
        echo "Error: --to=<port> is required"
        return 1
    end

    # create the tunnel
    ssh -R $name:$to_port:localhost:$from_port tuns.sh
end
