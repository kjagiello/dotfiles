function fish_prompt
   set -l last_status $status
   set -l cyan (set_color -o cyan)
   set -l yellow (set_color -o yellow)
   set -l red (set_color -o red)
   set -l blue (set_color -o blue)
   set -l green (set_color -o green)
   set -l normal (set_color normal)

   set_color yellow
   printf '%s' (whoami)
   set_color normal
   printf ' in '

   set_color $fish_color_cwd
   printf '%s' (pwd)
   set_color normal

   # Line 2
   echo
   if test $VIRTUAL_ENV
       printf "(%s) " (set_color normal)(basename $VIRTUAL_ENV)(set_color normal)
   end
   if test $DOCKER_HOST
       printf "[%s] " (set_color red)(echo $DOCKER_STACK)(set_color normal)
   end
   printf '↪ '
   set_color normal
end
