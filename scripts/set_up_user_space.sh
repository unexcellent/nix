#!/bin/bash

# This script creates the /Users/<name>/user directory and a symlink at the Macos root directory. 
# Reboot the system for the changes to take effect.

USER_SPACE="${HOME}/user"
ROOT_SYMLINK="user"

if [ ! -d "${USER_SPACE}" ]; then
    mkdir -p "${USER_SPACE}"
fi

SYNTHETIC_CONF_ENTRY="${ROOT_SYMLINK}\t${USER_SPACE}"

if ! grep -q -P "^\Q${ROOT_SYMLINK}\E\t\Q${USER_SPACE}\E$" "/etc/synthetic.conf"; then
  echo -e "${SYNTHETIC_CONF_ENTRY}" | sudo tee -a "/etc/synthetic.conf" > /dev/null
fi
