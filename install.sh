#!/bin/bash

### All dotfiles on home dir
find . -name ".*" -type f | grep -v ".gitignore" | grep -v ".swp" | awk -F './' '{print $2}' | xargs -I {} ln -sf $(pwd)/{} ~/

### Oh-my-zsh customizations
find ./oh-my-zsh-custom/plugins -mindepth 1 -maxdepth 1 -type d | xargs -I {} ln -sf $(pwd)/{} ~/.oh-my-zsh/custom/plugins

echo "Dotfile Installed!"