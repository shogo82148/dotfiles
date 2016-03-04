# .bash_profile

if [ -x /usr/libexec/path_helper ]; then
    PATH=""
    eval `/usr/libexec/path_helper -s`
fi

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

export GOPATH=$HOME/gocode
export PATH="$GOPATH/bin:$PATH"

peco_history() {
    declare l=$(HISTTIMEFORMAT=  history | LC_ALL=C sort -r |  awk '{for(i=2;i<NF;i++){printf("%s%s",$i,OFS=" ")}print $NF}'   |  peco --query "$READLINE_LINE")
    READLINE_LINE="$l"
    READLINE_POINT=${#l}
}
bind -x '"\C-r": peco_history'

function pcd {
    local dir="$( ghq list --full-path | peco )"
    if [ ! -z "$dir" ] ; then
        cd "$dir"
    fi
}

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
