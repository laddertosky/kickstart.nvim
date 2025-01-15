#!/bin/bash

venv_path=""
current_path="$PWD"
for i in {1..5}; do
    if [ -d "$current_path/venv" ]; then
        venv_path="$current_path/venv"
        break
    fi
    current_path="$current_path/.."
done
if [ -n "$venv_path" ]; then
    source "$venv_path/bin/activate"
fi
