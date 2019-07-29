function fish_prompt

   printf "%s in %s" \
      (set_color yellow)(whoami)(set_color normal) \
      (set_color $fish_color_cwd)(pwd)(set_color normal)

   # Line 2
   echo
   if test $VIRTUAL_ENV
       printf "(%s:%s) " \
          (set_color cyan)(echo "venv")(set_color normal) \
          (set_color normal)(basename (dirname $VIRTUAL_ENV))(set_color normal)
   end
   if test $DOCKER_HOST
       printf "[%s] " (set_color red)(echo $DOCKER_STACK)(set_color normal)
   end
   printf "↪ "
   set_color normal
end
