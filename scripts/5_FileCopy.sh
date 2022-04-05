#!/bin/bash

SSH_DIR=~/.ssh/
SCRIPT_DIR=$(cd $(dirname $0); pwd)
ETC_DIR=$(cd ${SCRIPT_DIR}/../etc; pwd)

cp ${ETC_DIR}/.ssh/config ${SSH_DIR}
