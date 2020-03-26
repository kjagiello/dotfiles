function flog --description 'Fuzzy git log search that outputs the selected hash'
  git log --color=always --decorate --oneline | fzf --ansi --reverse | awk '{ print $1 }'
end
