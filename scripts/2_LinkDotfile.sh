#!/bin/bash

SCRIPT_DIR=$(cd $(dirname $0); pwd)
DOTFILE_DIR=$(cd ${SCRIPT_DIR}/../dotfiles; pwd)

for file in `\find ${DOTFILE_DIR} -maxdepth 1 -name '.*'`; do
    basename=`basename ${file}`
    printf "Link ${basename}..."
    if [ -e  ~/${basename} ]; then
        printf "\e[33mEXISTS\e[m\n"
    else
        ln -s ${file} ~/${basename}
        printf "\e[32mDONE\e[m\n"
    fi
done
