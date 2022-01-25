#!/bin/bash

# bootstap script.

set -uxe

TMPDIR=$(mktemp -d)
trap 'rm -rfv "$TMPDIR"' EXIT

case "$(uname)" in
    "Darwin")
        mitamae_os="darwin"
        ;;
    *)
        echo "unknown uname: $(uname)"
        exit 1
        ;;
esac

case "$(uname -m)" in
    "x86_64")
        mitamae_arch="x86_64"
        ;;
    "arm64")
        mitamae_arch="aarch64"
        ;;
    *)
        echo "unsupported architecture: $(uname -m)"
        exit 1
        ;;
esac
MITAMAE="mitamae-${mitamae_arch}-${mitamae_os}"

# install mitamae
VERSION=1.12.8
cd "$TMPDIR"
curl -sSL "https://github.com/itamae-kitchen/mitamae/releases/download/v$VERSION/$MITAMAE.tar.gz" -o mitamae.tar.gz
tar xzvf mitamae.tar.gz
mkdir -p ~/bin/
install -m 0755 "$MITAMAE" ~/bin/mitamae
