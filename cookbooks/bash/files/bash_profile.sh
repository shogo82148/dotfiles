#!/bin/bash
# .bash_profile

if [ -x /usr/libexec/path_helper ]; then
    eval "$(/usr/libexec/path_helper -s)"
fi

# 環境変数の設定
export LC_ALL="ja_JP.UTF-8"
export LANG="ja_JP"
export PS1='[\u@\H \W]\\$ '

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
    # shellcheck source=/dev/null
    . ~/.bashrc
fi

export GOPATH=$HOME
export GO111MODULE=on

export PATH="$GOPATH/bin:$PATH"

if [[ -d "$HOME/.plenv" ]]; then
    export PATH="$HOME/.plenv/bin:$PATH"
    eval "$(plenv init -)"
fi

if [[ -d "$HOME/.rbenv" ]]; then
    export PATH="$HOME/.rbenv/bin:$PATH"
    eval "$(rbenv init -)"
fi

if command -v pyenv; then
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
fi

# マシン固有の設定
if [ -f ~/.bashlocal ]; then
    # shellcheck source=/dev/null
    . ~/.bashlocal
fi
