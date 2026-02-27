function workon --description 'Moves you to the project directory and activates the associated virtualenv, if any found.'
    if test (count $argv) -ne 1
        echo 'Usage: workon [project]'
        return 1
    end

    set -l dev_root $HOME/Dev

    # Search through all immediate subfolders of Dev/ for the project name
    for project_path in $dev_root/*/$argv
        if test -d $project_path
            cd $project_path

            # Initialization script
            if test -e .init.sh
                source .init.sh
            end

            # Virtual Environment activation
            if test -e .venv/bin/activate.fish
                source .venv/bin/activate.fish
            end

            echo "You are now working on '$argv'."
            return 0
        end
    end

    echo "Project '$argv' was not found in any subfolder of $dev_root."
    return 1
end
