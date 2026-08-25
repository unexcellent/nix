#!/bin/bash

SOURCE_DIRS=(
    "/Applications"
    "/System/Applications"
    "/Applications/Nix Apps"
    "${HOME}/Applications/Home Manager Apps"
)

TARGET_DIR="${HOME}/user/apps"

rm -rf "$TARGET_DIR"
mkdir -p "$TARGET_DIR"

for SOURCE_DIR in "${SOURCE_DIRS[@]}"; do
    for ITEM in "$SOURCE_DIR"/*.app; do
        TARGET_PATH="$TARGET_DIR/$(basename "$ITEM")"
        ln -sf "$ITEM" "$TARGET_PATH"
    done
done