#!/usr/bin/env fish

brew install fish fzf bat

# Install and activate fisher
curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish
fish -c fisher

fish -c 'fisher add jorgebucaran/fish-nvm'
