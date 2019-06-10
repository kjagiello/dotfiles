function weather --description 'Shows weather forecast for given place'
    if test (count $argv) -ne 1
        echo 'Usage: weather [city]'
        return
    end

	curl wttr.in/$argv
end
