#!/bin/sh
cd $(dirname $0)
for dotfile in .?*
do
    if [ $dotfile != '..' ] && [ $dotfile != '.git' ] && [ $dotfile != 'vimfiles' ] && [ $dotfile != '.gitmodules' ] && [ $dotfile != '.gitignore' ]
    then
        ln -Fis "$PWD/$dotfile" $HOME
    fi
done

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
    git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
fi

if [ ! -e ~/.nvm ]; then
    git clone git://github.com/creationix/nvm.git ~/.nvm
fi

go get golang.org/x/tools/cmd/goimports
go get github.com/nsf/gocode
go get github.com/peco/peco/cmd/peco
