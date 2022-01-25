#!/bin/zsh
# .zprofile

# 環境変数の設定
export LC_ALL="ja_JP.UTF-8"
export LANG="ja_JP"

# https://git-scm.com/book/ja/v2/Appendix-A%3A-%E3%81%9D%E3%81%AE%E4%BB%96%E3%81%AE%E7%92%B0%E5%A2%83%E3%81%A7%E3%81%AEGit-Zsh%E3%81%A7Git%E3%82%92%E4%BD%BF%E3%81%86
autoload -Uz compinit && compinit
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT=\$vcs_info_msg_0_
zstyle ':vcs_info:git:*' formats '%b'

# Get the aliases and functions
if [ -f ~/.zshrc ]; then
    # shellcheck source=/dev/null
    . ~/.zshrc
fi

# Go の環境変数設定
export GOPATH=$HOME
export GO111MODULE=on
export PATH="$GOPATH/bin:$HOME/bin:<%= @homebrew_bin %>:$PATH"
