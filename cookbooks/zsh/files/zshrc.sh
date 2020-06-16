#!/bin/zsh
# .zshrc

if command -v direnv; then
    eval "$(direnv hook bash)"
fi

autoload bashcompinit && bashcompinit
complete -C '/usr/local/bin/aws_completer' aws
