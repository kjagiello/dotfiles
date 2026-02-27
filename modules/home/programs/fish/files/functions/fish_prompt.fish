function fish_prompt
    set_color yellow
    printf "%s in " (whoami)
    set_color green
    printf "%s" (prompt_pwd)
    set_color normal

    # Line 2
    echo
    if test $VIRTUAL_ENV
        printf "(%s:%s) " \
           (set_color cyan)(echo "venv")(set_color normal) \
           (set_color normal)(basename (basename (dirname $VIRTUAL_ENV)))(set_color normal)
    end
    if test $DOCKER_HOST
        printf "[%s] " (set_color red)(echo $DOCKER_STACK)(set_color normal)
    end
    printf "\$ "
    set_color normal
end
