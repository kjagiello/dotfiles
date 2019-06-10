function wake --description 'Wake on lan with friendly names'
    if test (count $argv) -ne 1
        echo 'Usage: wake [device name or MAC address]'
        return
    end

    set -l config $HOME'/.wolconfig'
    set -l macaddr (grep $argv $config | cut -f 1)

    if test -z $macaddr
        set -l macaddr $argv
    end

    wakeonlan $macaddr
end
