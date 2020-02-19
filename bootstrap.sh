#!/bin/bash

# bootstap script.

set -uxe

TMPDIR=$(mktemp -d)
trap 'rm -rfv "$TMPDIR"' EXIT

# install mitamae
VERSION=1.11.0
cd "$TMPDIR"
curl -sSL "https://github.com/itamae-kitchen/mitamae/releases/download/v$VERSION/mitamae-x86_64-darwin.tar.gz" -o mitamae.tar.gz
tar xzvf mitamae.tar.gz
mkdir -p ~/bin/
mv mitamae-x86_64-darwin ~/bin/mitamae
