# dot-tmux

Portable tmux config optimized for macOS (works on Linux too). Features vim-style navigation, enhanced clipboard integration, and carefully selected plugins for a productive terminal workflow.

## Features

- **Screen-style prefix**: Uses `Ctrl-a` instead of default `Ctrl-b`
- **Intuitive splits**: `|` for vertical, `-` for horizontal
- **Vim-style navigation**: Alt + hjkl for pane navigation
- **Mouse support**: Click and drag to resize panes and scroll
- **macOS clipboard integration**: Seamless copy/paste with system clipboard
- **Session persistence**: Automatic session save/restore
- **Enhanced status line**: Shows session, window, and time information

## Install

```bash
git clone git@github.com:<you>/dot-tmux.git ~/src/dot-tmux
cd ~/src/dot-tmux
./scripts/bootstrap_macos.sh
```

After installation:
1. Open tmux: `tmux`
2. Install plugins: Press `Ctrl-a` then `I` (capital i) to install plugins via TPM

## Key Bindings

### Prefix Key
- **Prefix**: `Ctrl-a` (replaces default `Ctrl-b`)
- **Send prefix to application**: `Ctrl-a Ctrl-a`

### Window & Pane Management

#### Creating Splits
- **Vertical split** (side by side): `Ctrl-a |`
- **Horizontal split** (top/bottom): `Ctrl-a -`

#### Navigation
- **Move to left pane**: `Alt-h`
- **Move to right pane**: `Alt-l`
- **Move to pane above**: `Alt-k`
- **Move to pane below**: `Alt-j`

#### Resizing Panes
- **Resize left**: `Alt-Left`
- **Resize right**: `Alt-Right`
- **Resize up**: `Alt-Up`
- **Resize down**: `Alt-Down`

### Copy Mode (Vi-style)
- **Enter copy mode**: `Ctrl-a [`
- **Copy selection**: `y` (in copy mode)
- **Paste**: `Ctrl-a ]`

*Note: Copy integrates with macOS clipboard via `pbcopy`*

## Configuration Details

### Quality of Life Improvements
- **Mouse support**: Enabled for clicking, dragging, and scrolling
- **Base index**: Windows and panes start at 1 (not 0)
- **Vi mode**: Use vim-style key bindings in copy mode
- **macOS clipboard**: Requires `reattach-to-user-namespace` (installed via bootstrap script)

### Status Line
- **Left side**: Shows session name, window index, and pane index
- **Right side**: Shows current date and time (YYYY-MM-DD HH:MM)
- **Colors**: Black background with colored text for different elements

### Local Configuration
The config automatically loads `~/.config/tmux/local.conf` if it exists, allowing for machine-specific customizations without affecting the main config.

## Plugins

This configuration uses [TPM (Tmux Plugin Manager)](https://github.com/tmux-plugins/tpm) with the following plugins:

- **tmux-sensible**: Sensible default settings
- **tmux-yank**: Enhanced copying to system clipboard
- **tmux-resurrect**: Save and restore tmux sessions
- **tmux-continuum**: Automatic session saving and restoration

### Plugin Management
- **Install plugins**: `Ctrl-a I`
- **Update plugins**: `Ctrl-a U`
- **Remove plugins**: `Ctrl-a Alt-u`

## Prerequisites

### macOS
The bootstrap script installs:
- `reattach-to-user-namespace` (for clipboard integration)
- `tmux` (if not already installed)

### Manual Installation
If not using the bootstrap script:
```bash
# macOS
brew install tmux reattach-to-user-namespace

# Install TPM
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Link config
ln -sf ~/src/dot-tmux/tmux.conf ~/.tmux.conf
```

## Troubleshooting

### Clipboard Not Working
Ensure `reattach-to-user-namespace` is installed:
```bash
brew install reattach-to-user-namespace
```

### Plugins Not Loading
1. Make sure TPM is installed in `~/.tmux/plugins/tpm`
2. Reload tmux config: `Ctrl-a r` (if you have a reload binding) or restart tmux
3. Install plugins: `Ctrl-a I`

### Alt Key Not Working
On some terminals, you may need to configure the Alt key to send escape sequences. Check your terminal's preferences for "Option as Meta key" or similar settings.

## Customization

To add your own customizations without modifying the main config:

1. Create `~/.config/tmux/local.conf`
2. Add your custom settings there
3. Reload tmux: `tmux source-file ~/.tmux.conf`

Example local.conf:
```bash
# Custom key bindings
bind r source-file ~/.tmux.conf \; display-message "Config reloaded!"

# Different status line colors
set -g status-bg blue
```
