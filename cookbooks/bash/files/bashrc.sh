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

function git-install-license {
    local license
    license="$(git rev-parse --show-toplevel)/LICENSE.md"
    cat <<EOF > "$license"
The MIT License (MIT)

Copyright (c) $(date +%Y) $(git config --get user.name)

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
EOF
    git add "$license"
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

# added by travis gem
[ -f /Users/shogoichinose/.travis/travis.sh ] && source /Users/shogoichinose/.travis/travis.sh

if command -v direnv; then
    eval "$(direnv hook bash)"
fi

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
