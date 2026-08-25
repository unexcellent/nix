#!/bin/bash

SOURCE_DIR="${HOME}/Library/Mobile Documents/com~apple~CloudDocs"
TARGET_DIR="${HOME}/user/drive"

if [ ! -e "$TARGET_DIR" ]; then
    ln -s "${SOURCE_DIR}" "${TARGET_DIR}"
fi