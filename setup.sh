#!/bin/sh
cd "$(dirname "$0")" || exit
for dotfile in .*
do
    # ignore special directories.
    if [ "$dotfile" = '.' ] || [ "$dotfile" = '..' ]; then
        continue
    fi

    # ignore git configure files.
    if [ "$dotfile" = '.git' ] || [ "$dotfile" = '.gitmodules' ] || [ "$dotfile" = '.gitignore' ]; then
        continue
    fi

    # ignore backup files.
    if echo "$dotfile" | grep ~\$ > /dev/null; then
        continue
    fi

    ln -Fis "$PWD/$dotfile" "$HOME"
done

if [ -d "$HOME/Library/Application Support/Code" ]; then
    if [ ! -L "$HOME/Library/Application Support/Code/User" ]; then
        if [ -d "$HOME/Library/Application Support/Code/User" ]; then
            mv "$HOME/Library/Application Support/Code/User" "$HOME/Library/Application Support/Code/User_backup"
        fi
        ln -is "$PWD/vscode" "$HOME/Library/Application Support/Code/User"
    fi
fi

if [ ! -e ~/.plenv ]; then
    git clone git://github.com/tokuhirom/plenv.git ~/.plenv
fi

if [ ! -e ~/.plenv/plugins/perl-build ]; then
    git clone git://github.com/tokuhirom/Perl-Build.git ~/.plenv/plugins/perl-build/
fi

if [ ! -e ~/.pyenv ]; then
    git clone git://github.com/yyuu/pyenv.git ~/.pyenv
fi

if [ ! -e ~/.pyenv/plugins/pyenv-virtualenv ]; then
    git clone git://github.com/yyuu/pyenv-virtualenv.git ~/.pyenv/plugins/pyenv-virtualenv
fi

if [ ! -e ~/.rbenv ]; then
    git clone https://github.com/rbenv/rbenv.git ~/.rbenv
fi

if [ ! -e ~/rbenv/plugins/ruby-build ]; then
    mkdir -p ~/rbenv/plugins
    git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
fi

if [ ! -e ~/.nvm ]; then
    git clone git://github.com/creationix/nvm.git ~/.nvm
fi
