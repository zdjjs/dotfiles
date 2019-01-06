#!/bin/bash

SCRIPT_DIR=$(cd $(dirname $0); pwd)
if [ ! -r /usr/local/bin/brew ] ; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew bundle --file=${SCRIPT_DIR}/../Brewfile
brew cleanup

if [ -e /usr/local/share/zsh-completions ]; then
    chmod go-w /usr/local/share
fi
