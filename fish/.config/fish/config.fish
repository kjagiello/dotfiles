# Disable the greeter
set fish_greeting

set -x LANG en_US.UTF-8
set -x LC_CTYPE en_US.UTF-8

set -x FZF_DEFAULT_COMMAND "rg --files --hidden --glob '!.git/*' --glob '!node_modules/*'"

set -x EDITOR "nvim"

# Init pyenv
if begin; status --is-interactive; and type -f pyenv > /dev/null; end
    . (pyenv init -|psub)
end

set -x VIRTUAL_ENV_DISABLE_PROMPT 1

set PATH "./node_modules/.bin" "/usr/local/sbin" $PATH

if status --is-interactive
    set -g fish_user_abbreviations
    abbr --add dc docker-compose
    abbr --add d docker
    abbr --add vi nvim
end

# Improve ls colors on black background
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

# GPG agent
set -x GPG_TTY (tty)

# direnv seems to not load .envrc when opening a new split in tmux. This hack
# solves the problem.
cd .
