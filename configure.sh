#!/bin/bash

CURRENT_DIR=$(dirname $0)

cp $CURRENT_DIR/tmux/.tmux.conf ~/
echo "~/.tmux.conf" is updated with the file in this repo.

Tmux=$(which tmux)

if [ -z "$Tmux" ]; then
    echo "Remember to install tmux with your package manager or build from the source."
    echo "For further information, see https://github.com/tmux/tmux/wiki/Installing"
    echo 1
fi

# install the tpm if not installed yet
[ -d ~/.tmux ] || git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
