function workon --description 'Moves you to the project directory and activates the associated virtualenv, if any found.'
    if test (count $argv) -ne 1
        echo 'Usage: workon [project]'
        return
    end

    set -l dev_dir $HOME
    set -l project_dirs 'Dev/billo/' 'Dev/private/'

    for dir in $project_dirs
        if test -d $dev_dir'/'$dir'/'$argv
            cd $dev_dir'/'$dir'/'$argv
                if test -e .init.sh
                    source .init.sh
                end

                if test -e .venv/bin/activate.fish
                    source .venv/bin/activate.fish
                end

                echo 'You are now working on "'$argv'".'
            return
        end
    end

    echo 'Project '$argv' was not found.'
end
