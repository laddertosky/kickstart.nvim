#!/bin/bash

CURRENT_DIR=$(dirname $0)

Pack=$(which apt)
if [ -z "$Pack" ]; then
    echo "Configure the command for package manager in this script."
    exit 1
fi
Pack="sudo apt install -y"

$Pack nvim \
    jq \
    fzf \
    ripgrep \
    unzip \
    npm \
    tmux

cp $CURRENT_DIR/tmux/.tmux.conf ~/
echo "~/.tmux.conf" is updated with the file in this repo.

# install the tpm if not installed yet
[ -d ~/.tmux ] || git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
echo "Remember to install tpm plugin with <leader>I in tmux session"
