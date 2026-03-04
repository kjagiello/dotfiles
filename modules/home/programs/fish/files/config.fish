# Disable the greetings
set fish_greeting

# Locale
set -x LANG en_US.UTF-8
set -x LC_CTYPE en_US.UTF-8

# Default editor
set -x EDITOR "nvim"

# Configure the TTY for GnuPG
set -x GPG_TTY (tty)

if status is-interactive
    set fish_user_abbreviations

    abbr -a vi "nvim"
    abbr -a d "docker"
    abbr -a dc "docker compose"
    abbr -a t "terraform"
    abbr -a k "kubectl"

    set -x PATH $HOME/.local/bin ./node_modules/.bin $PATH
    set -x FZF_DEFAULT_COMMAND rg --files
end

eval "$(/opt/homebrew/bin/brew shellenv fish)"

. /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.fish
