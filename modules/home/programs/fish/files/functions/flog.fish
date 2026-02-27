function __flog_list_hashes
    git log --date=short --format="%C(auto)%h %C(green)%C(bold)%cd%C(auto)%d %s (%an)" --color=always --decorate
end

function flog --description "Fuzzy find Git hashes with fancy preview"
    __flog_list_hashes | \
    fzf --ansi \
        --height 80% \
        --layout reverse --multi --min-height 20+ \
        --border \
        --border-label-pos 2 \
        --border-label '🍡 Hashes ' \
        --header-border horizontal \
        --tiebreak begin \
        --cycle \
        --info inline \
        --no-hscroll \
        --expect enter \
        --preview-window 'down,border-top,40%' \
        --preview-border line \
        --preview '
            set -l hash (echo {} | awk '{print $1}')
            git show --color=always $hash
        ' | awk '{print $1}' | sed -n '/^enter$/,$p' | sed '1d' | string join " "
end
