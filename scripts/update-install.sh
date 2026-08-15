#!/usr/bin/env bash
# Update this checkout, install its binaries, and restart the user service.

set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

cd "$REPO_ROOT"

echo "==> Pulling latest changes with rebase"
git pull --rebase

echo "==> Installing whisrs from $REPO_ROOT"
cargo install --path . --force --features vulkan

echo "==> Restarting whisrs.service for the current user"
systemctl --user restart whisrs.service

echo "==> whisrs update complete"
