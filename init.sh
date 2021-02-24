#!/bin/bash

set -eu

cd `dirname $0`
SCRIPT_DIR=$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)

# Make workspace
mkdir -p ~/Workspace

# rbenv
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
cd ~/.rbenv && src/configure && make -C src

## rbenv-build
export PATH=$PATH:$HOME/.rbenv/bin
mkdir -p "$(rbenv root)"/plugins
git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build

## go
mkdir -p ~/Workspace/go
$SCRIPT_DIR/go_installer.sh 1.15.6 linux amd64

## rust
curl https://sh.rustup.rs -sSf | sh

## opam
sh <(curl -sL https://raw.githubusercontent.com/ocaml/opam/master/shell/install.sh)

# nodebrew
curl -L git.io/nodebrew | perl - setup

# linkapp
ln -s $SCRIPT_DIR/.zshrc $HOME
ln -s $SCRIPT_DIR/.bashrc $HOME
ln -s $SCRIPT_DIR/.emacs.d $HOME
ln -s $SCRIPT_DIR/.vimrc $HOME
ln -s $SCRIPT_DIR/.tmux.conf $HOME
if [ ! -d $HOME/.config ]; then
    mkdir $HOME/.config
fi
ln -s $SCRIPT_DIR/fish $HOME/.config/

if [ ! -d $HOME/.emacs.d/elisp ]; then
    mkdir -p $SCRIPT_DIR/.emacs.d/elisp
fi
cd $SCRIPT_DIR/.emacs.d/elisp
git clone https://github.com/antonj/Highlight-Indentation-for-Emacs

# vim-plug
cd $SCRIPT_DIR
if [ ! -d $HOME/.vim ]; then
    mkdir $HOME/.vim
fi
## vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
## nvim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
