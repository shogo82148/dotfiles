#!/bin/zsh
# .zshrc

if command -v direnv; then
    eval "$(direnv hook bash)"
fi

# from https://qiita.com/shepabashi/items/f2bc2be37a31df49bca5
function peco-history-selection() {
    BUFFER=`history -n 1 | tail -r  | awk '!a[$0]++' | peco`
    CURSOR=$#BUFFER
    zle reset-prompt
}

zle -N peco-history-selection
bindkey '^R' peco-history-selection

autoload bashcompinit && bashcompinit
complete -C '/usr/local/bin/aws_completer' aws
