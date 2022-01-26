#!/bin/zsh
# .zshrc

if command -v direnv > /dev/null 2>&1; then
    eval "$(direnv hook zsh)"
fi

if command -v nodenv > /dev/null 2>&1; then
    eval "$(nodenv init -)"
fi

if command -v plenv > /dev/null 2>&1; then
    eval "$(plenv init -)"
fi

if command -v rbenv > /dev/null 2>&1; then
    eval "$(rbenv init -)"
fi

if command -v pyenv > /dev/null 2>&1; then
    eval "$(pyenv init --path)"
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
    local selected_dir=$(ghq list | peco)
    if [ -n "$selected_dir" ]; then
    cd "$(ghq root)/$selected_dir"
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
complete -C '<%= @homebrew_bin %>/aws_completer' aws

# マシン固有の設定
if [ -f "$HOME/.zshrc.local" ]; then
    . "$HOME/.zshrc.local"
fi
