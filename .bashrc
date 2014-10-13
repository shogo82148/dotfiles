# .bashrc

# 環境変数の設定
export LC_ALL="ja_JP.UTF-8"
export LANG="ja_JP"
export PS1='[\u@\h \W]\\$ '

# gitコマンド補完
if [ -f ~/.git-completion.bash ]; then
    . ~/.git-completion.bash
fi

# gitブランチ表示
if [ -f ~/.git-prompt.sh ]; then
    . ~/.git-prompt.sh
    export PS1='[\u@\h \W$(__git_ps1 "(%s)")]\\$ '
fi

# マシン固有の設定
if [ -f ~/.bashlocal ]; then
    . ~/.bashlocal
fi

# rvmのインストール
if [[ -s $HOME/.rvm/scripts/rvm ]] ; then
    PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
    source $HOME/.rvm/scripts/rvm
fi

peco_history() {
    declare l=$(HISTTIMEFORMAT=  history | LC_ALL=C sort -r |  awk '{for(i=2;i<NF;i++){printf("%s%s",$i,OFS=" ")}print $NF}'   |  peco --query "$READLINE_LINE")
    READLINE_LINE="$l"
    READLINE_POINT=${#l}
}
bind -x '"\C-r": peco_history'

# added by travis gem
[ -f ~/.travis/travis.sh ] && source ~/.travis/travis.sh
