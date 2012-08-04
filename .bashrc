# .bashrc

# 環境変数の設定
export EDITOR=emacs
export LC_ALL="ja_JP.UTF-8"
export LANG="ja_JP"

# gitコマンド補完
if [ -f ~/.git-completion.bash ]; then
    . ~/.git-completion.bash
fi

# マシン固有の設定
if [ -f ~/.bashlocal ]; then
    . ~/.bashlocal
fi
