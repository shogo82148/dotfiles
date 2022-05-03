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

if command -v direnv > /dev/null 2>&1; then
    eval "$(direnv hook bash)"
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
    eval "$(pyenv init -)"
    PATH=$(pyenv root)/shims:$PATH
    export PATH
fi

alias python=python3
alias pip=pip3

# マシン固有の設定
if [ -f ~/.bashlocal ]; then
    # shellcheck source=/dev/null
    . ~/.bashlocal
fi
