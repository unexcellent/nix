#!/bin/bash

CONFIG_DIR="${HOME}/user/config"
NIX_DARWIN_REPO="git@github.com:unexcellent/nix-darwin.git"

if [ ! -e "$CONFIG_DIR" ]; then
    mkdir "$CONFIG_DIR"
fi

if [ ! -d "$CONFIG_DIR/nix-darwin" ]; then
    git clone "$NIX_DARWIN_REPO" "$CONFIG_DIR/nix-darwin"
fi