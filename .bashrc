# .bashrc

# added by travis gem
[ -f ~/.travis/travis.sh ] && source ~/.travis/travis.sh

peco_history() {
    declare l=$(HISTTIMEFORMAT=  history | LC_ALL=C sort -r |  awk '{for(i=2;i<NF;i++){printf("%s%s",$i,OFS=" ")}print $NF}'   |  peco --query "$READLINE_LINE")
    READLINE_LINE="$l"
    READLINE_POINT=${#l}
}
if [[ -t 1 ]]; then
    bind -x '"\C-r": peco_history'
fi

function pcd {
    local dir
    dir="$( ghq list --full-path | peco )"
    if [ ! -z "$dir" ] ; then
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

# gitコマンド補完
if [ -f ~/.bash.d/git-completion.bash ]; then
    . ~/.bash.d/git-completion.bash
fi

# gitブランチ表示
if [ -f ~/.bash.d/git-prompt.sh ]; then
    . ~/.bash.d/git-prompt.sh
    export PS1='[\u@\h \W$(__git_ps1 "(%s)")]\\$ '
fi

# rustupの補完
if [ -f ~/.bash.d/rustup.bash-completion.bash ]; then
    . ~/.bash.d/rustup.bash-completion.bash
fi

test -e "${HOME}/.bash.d/iterm2_shell_integration.bash" && source "${HOME}/.bash.d/iterm2_shell_integration.bash"
