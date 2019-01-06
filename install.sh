#!/bin/bash

set -eu

sudo -v

for file in `\find $(dirname ${0})/scripts -maxdepth 1 -type f -name '*.sh' | sort`; do
    basename=`basename ${file}`
    printf "\e[36mRun ${basename}\e[m\n"
    bash ${file}
    printf "\e[32mDONE\e[m\n"
done

