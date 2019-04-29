#!/bin/bash
# .bash_profile

if [ -x /usr/libexec/path_helper ]; then
    eval `/usr/libexec/path_helper -s`
fi

# 環境変数の設定
export LC_ALL="ja_JP.UTF-8"
export LANG="ja_JP"
export PS1='[\u@\H \W]\\$ '

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

export GOPATH=$HOME
export PATH="$GOPATH/bin:$PATH"

if command -v aws_completer ; then
    complete -C "$(command -v aws_completer)" aws
fi

# マシン固有の設定
if [ -f ~/.bashlocal ]; then
    . ~/.bashlocal
fi
