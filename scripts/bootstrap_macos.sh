#!/usr/bin/env bash

# one-time setup per machine

set -euo pipefail

# Install tmux + clipboard helper + git (if missing)
if ! command -v brew >/dev/null 2>&1; then
  echo "Homebrew not found. Install from https://brew.sh first."
  exit 1
fi

brew install tmux reattach-to-user-namespace git

# Install TPM (tmux plugin manager)
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
  git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
fi

# Link config to standard locations
mkdir -p "$HOME/.config/tmux"
ln -sf "$PWD/tmux.conf" "$HOME/.tmux.conf"
ln -sf "$PWD/tmux.conf" "$HOME/.config/tmux/tmux.conf"

# Optional local overrides file
touch "$HOME/.config/tmux/local.conf"

# Load tmux config if tmux is running; otherwise this is harmless
tmux start-server >/dev/null 2>&1 || true
tmux source-file "$HOME/.tmux.conf" >/dev/null 2>&1 || true

echo "✅ tmux ready. Open tmux and press: Ctrl-a then I (capital i) to install plugins."

