#!/bin/zsh
# .zshrc

if command -v direnv; then
    eval "$(direnv hook bash)"
fi
