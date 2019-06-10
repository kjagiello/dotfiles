function pypi --description 'Opens the '
    if test (count $argv) -ne 1
        echo 'Usage: pypi [package name]'
        return
    end

    open "https://pypi.org/project/$argv/"
end
