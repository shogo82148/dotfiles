#!/bin/bash
# .bashrc

# added by travis gem
# shellcheck source=/dev/null
[ -f ~/.travis/travis.sh ] && source ~/.travis/travis.sh

peco_history() {
    l=$(HISTTIMEFORMAT=''  history | LC_ALL=C sort -r |  awk '{for(i=2;i<NF;i++){printf("%s%s",$i,OFS=" ")}print $NF}'   |  peco --query "$READLINE_LINE")
    declare l="$l"
    READLINE_LINE="$l"
    READLINE_POINT=${#l}
}
if [[ -t 1 ]]; then
    bind -x '"\C-r": peco_history'
fi

function pcd {
    local dir
    dir="$( ghq list --full-path | peco )"
    if [ -n "$dir" ] ; then
        cd "$dir" || exit
    fi
}

function paws {
    AWS_PROFILE=$(perl -nle 'print $1 if /^[[](?:profile\s+)?([^]]+)/' ~/.aws/config | peco)
    export AWS_PROFILE
    echo "AWS_PROFILE is now $AWS_PROFILE"
}

function penv {
    APP_ENV=$( (echo development; echo staging; echo production) | peco)
    export APP_ENV
    echo "APP_ENV is now $APP_ENV"
}

if [ -d ~/.bash.d ]; then
    for f in ~/.bash.d/*; do
        # shellcheck source=/dev/null
        . "$f"
    done
fi

if [ -d /usr/local/etc/bash_completion.d ]; then
    for f in /usr/local/etc/bash_completion.d/*; do
        # shellcheck source=/dev/null
        . "$f"
    done
fi

export PS1='[\W$(__git_ps1 "(%s)")]\\$ '

if command -v direnv; then
    eval "$(direnv hook bash)"
fi

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
