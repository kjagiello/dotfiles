#!/usr/bin/env fish

brew install coreutils gnu-sed fish fzf bat tokei jq jo bat up entr ripgrep hadolint git-crypt

# Install and activate fisher
curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish
fish -c fisher

fish -c 'fisher add jorgebucaran/fish-nvm'
