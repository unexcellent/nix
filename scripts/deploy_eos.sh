#!/bin/bash
# Syncs the working tree (including uncommitted changes) to eos and builds there.
# Usage: scripts/deploy_eos.sh [switch|build|check]

set -euo pipefail

ACTION="${1:-switch}"
EOS_HOST="${EOS_HOST:-admin@eos}"
REPO_DIR="$(cd "$(dirname "$0")/.." && pwd)"

rsync -az --delete \
    --exclude=.git \
    --filter=':- .gitignore' \
    "$REPO_DIR/" "$EOS_HOST:.config/nix/"

# `path:` makes nix use the directory as-is instead of only git-tracked files,
# so new files work without `git add` on eos.
DARWIN_REBUILD="/run/current-system/sw/bin/darwin-rebuild $ACTION --flake path:\$HOME/.config/nix#eos"
if [ "$ACTION" = "build" ] || [ "$ACTION" = "check" ]; then
    ssh -t "$EOS_HOST" "$DARWIN_REBUILD"
else
    ssh -t "$EOS_HOST" "sudo $DARWIN_REBUILD"
fi
