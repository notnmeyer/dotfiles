function paste
    set -l filename
    set -l hidden true
    set -l expires 1h

    # Parse arguments
    for arg in $argv
        if string match -q -- "--hidden=*" $arg
            set hidden (string split "=" -- $arg)[2]
        else if string match -q -- "--expires=*" $arg
            set expires (string split "=" -- $arg)[2]
        else if not string match -q -- "--*" $arg
            set filename $arg
        end
    end

    # Build SSH command
    set -l ssh_args "pastes.sh"

    if test -n "$filename"
        set ssh_args $ssh_args $filename
    end

    set ssh_args $ssh_args "hidden=$hidden"
    set ssh_args $ssh_args "expires=$expires"

    # Execute the command
    echo "running: ssh $ssh_args"
    ssh $ssh_args
end
