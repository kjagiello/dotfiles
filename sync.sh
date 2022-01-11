#!/usr/bin/env bash

set -eu

# Set the current directory to the one of this script
cd "${0%/*}"

# Symlink the configs
[ ! -f /opt/homebrew/bin/stow ] && brew install stow
stow --ignore ".DS_Store" files/

# Install all the dependencies according to the Brewfile
brew bundle --no-lock

# Set the default shell, if needed
FISH_PATH='/opt/homebrew/bin/fish'
if ! grep -Fxq $FISH_PATH /etc/shells; then
  echo 'Making fish the default shell...'
  sudo sh -c "echo $FISH_PATH >> /etc/shells"
  DEFAULT_SHELL=$(dscl . -read /Users/$(whoami) UserShell | sed 's/UserShell: //')
  [[ $DEFAULT_SHELL != '/opt/homebrew/bin/fish' ]] && chsh -s /opt/homebrew/bin/fish
fi

# Install custom binaries
mkdir -p ~/.local/bin
rsync -qavh --delete bin/ ~/.local/bin

# Install fisher plugins
fisher_plugins=( jethrokuan/fzf )
for plugin in "${fisher_plugins[*]}"
do
  if ! fish -c "fisher list | grep -Fxq $plugin"; then
    fish -c "fisher install $plugin"
  fi
done

# Install vim-plug
if [ ! -f "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim ]; then
  sh -c 'curl -qfLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
         https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  nvim +PlugInstall +qall
fi

echo "The dotfiles have been installed successfully."
