#!/bin/zsh
# .zshrc

if command -v direnv; then
    eval "$(direnv hook zsh)"
fi

if command -v nodenv; then
    eval "$(nodenv init -)"
fi

# from https://qiita.com/shepabashi/items/f2bc2be37a31df49bca5
function peco-history-selection() {
    BUFFER=`history -n 1 | tail -r  | awk '!a[$0]++' | peco`
    CURSOR=$#BUFFER
    zle reset-prompt
}

zle -N peco-history-selection
bindkey '^R' peco-history-selection

function pcd () {
    local selected_dir=$(ghq list -p | peco)
    if [ -n "$selected_dir" ]; then
    cd "$selected_dir"
    fi
}

function paws {
    local profile=$(perl -nle 'print $1 if /^[[](?:profile\s+)?([^]]+)/' ~/.aws/config | peco)
    if [ -n "$profile" ]; then
        AWS_PROFILE=$profile
        export AWS_PROFILE
        echo "AWS_PROFILE is now $AWS_PROFILE"
    fi
}

function penv {
    local appenv=$( (echo development; echo staging; echo production) | peco)
    if [ -n "$appenv" ]; then
        APP_ENV=$appenv
        export APP_ENV
        echo "APP_ENV is now $APP_ENV"
    fi
}

autoload bashcompinit && bashcompinit
complete -C '/usr/local/bin/aws_completer' aws
