# .bashrc

# 環境変数の設定
export LC_ALL="ja_JP.UTF-8"
export LANG="ja_JP"
export PS1='[\u@\h \W]\\$ '

# added by travis gem
[ -f ~/.travis/travis.sh ] && source ~/.travis/travis.sh
