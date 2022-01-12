# Disable the greetings
set fish_greeting

# Locale
set -x LANG en_US.UTF-8
set -x LC_CTYPE en_US.UTF-8

# Default editor
set -x EDITOR "nvim"

# Brew
eval (env SHELL=fish /opt/homebrew/bin/brew shellenv)

# Custom paths
fish_add_path -m ~/.local/bin ~/.cargo/bin

# Configure the TTY for GnuPG
set -x GPG_TTY (tty)

if status is-interactive
    set fish_user_abbreviations

    abbr -a vi "nvim"
    abbr -a d "docker"
    abbr -a dc "docker-compose"
    abbr -a t "terraform"
    abbr -a k "kubectl"

    # pyenv support
    set -x PYENV_ROOT $HOME/.pyenv
    set fish_user_paths $PYENV_ROOT/bin $fish_user_paths

    pyenv init --path | source
    pyenv init - | source
end
