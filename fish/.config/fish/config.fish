# Disable the greeter
set fish_greeting

set -x LANG en_US.UTF-8
set -x LC_CTYPE en_US.UTF-8

set -x FZF_DEFAULT_OPTS "-x"
set -x FZF_DEFAULT_COMMAND 'ag -g ""'

set -x EDITOR "nvim"

# Init pyenv
if begin; status --is-interactive; and type -f pyenv > /dev/null; end
    . (pyenv init -|psub)
end

set -x VIRTUAL_ENV_DISABLE_PROMPT 1

set PATH "./node_modules/.bin" "/usr/local/sbin" $PATH
