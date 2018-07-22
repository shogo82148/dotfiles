# .bash_profile

if [ -x /usr/libexec/path_helper ]; then
    PATH=""
    eval `/usr/libexec/path_helper -s`
fi

# 環境変数の設定
export LC_ALL="ja_JP.UTF-8"
export LANG="ja_JP"
export PS1='[\u@\h \W]\\$ '

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

export PATH="$HOME/.plenv/bin:$PATH"
eval "$(plenv init -)"

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"

if [[ -s $HOME/.nvm/nvm.sh ]] ; then
    source $HOME/.nvm/nvm.sh ;
fi

export GOPATH=$HOME
export PATH="$GOPATH/bin:$PATH"

# rust
if [ -f ~/.cargo/env ]; then
    . ~/.cargo/env
fi

if command -v aws_completer ; then
    complete -C "$(command -v aws_completer)" aws
fi

# マシン固有の設定
if [ -f ~/.bashlocal ]; then
    . ~/.bashlocal
fi

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
