#!/bin/bash

if [ -f /usr/local/bin/zsh ] ; then
    if grep '/usr/local/bin/zsh' "/etc/shells" > /dev/null; then
        :
    else
        sudo sh -c "echo '/usr/local/bin/zsh' >> /etc/shells"
    fi
    chsh -s /usr/local/bin/zsh
else
    chsh -s /bin/zsh
fi