# Qwen Code Context: Rexsy's Dotfiles

This repository contains the personal configuration files (dotfiles) for Rexsy. It sets up a development environment primarily focused on Zsh, Tmux, Neovim, and Hyprland, with scripts for initial setup and managing a secondary monitor (likely an Android tablet used as a drawing tablet via VNC).

## Overview

These dotfiles are designed for a Linux system (specifically Arch Linux, based on the setup script) using the Hyprland Wayland compositor. The core components configured are:

- **Shell:** Zsh with Oh My Zsh framework.
- **Terminal Multiplexer:** Tmux.
- **Text Editor:** Neovim (kickstart.nvim configuration).
- **Window Manager:** Hyprland (with configuration for a headless output, likely for a VNC-connected tablet).
- **System Info Tool:** Fastfetch.

The repository also includes setup scripts to automate the installation of necessary packages and tools.

## Key Configurations

### Zsh (`.zshrc`)

- Uses Oh My Zsh with the `robbyrussell` theme.
- Enables plugins: `git`, `zsh-autosuggestions`, `zsh-syntax-highlighting`.
- Integrates `zoxide` for smarter directory navigation.
- Includes custom aliases for common tasks (e.g., `penv` for activating Python venvs, `svim` for sudo nvim).
- Sets up environment variables for API keys (OpenAI, DeepSeek, Gemini) and adds Go's binary directory to PATH.
- Defines a custom `fvim` function to open files selected via `fzf` in Neovim.
- Uses `fastfetch` for a system information display on shell startup.

### Tmux (`.tmux.conf`)

- Changes the default prefix key to `Ctrl-s`.
- Configures keybindings for splitting windows (`|` for vertical, `-` for horizontal) and pane navigation (`hjkl` in vi mode).
- Enables mouse support.
- Sets up keybindings for resizing panes (`Shift+hjkl`) and maximizing panes (`Shift+m`).
- Configures session switching using `F1-F5`.
- Integrates TPM (Tmux Plugin Manager) and includes plugins like `vim-tmux-navigator`, `tmux-online-status`, and `tmux-battery`.
- Includes a keybinding (`Ctrl+v`) to source the virtual environment activation script.

### Neovim (`~/.config/nvim/init.lua`)

- Based on the `kickstart.nvim` configuration template.
- Configures basic options like line numbers, mouse support, clipboard integration, etc.
- Sets up keymaps for navigation, diagnostics, and LSP actions.
- Uses `lazy.nvim` as the plugin manager.
- Includes a wide range of plugins for:
  - LSP (Language Server Protocol) support (`nvim-lspconfig`, `mason.nvim`).
  - Autocompletion (`nvim-cmp`, `LuaSnip`).
  - Fuzzy finding (`telescope.nvim`).
  - File tree navigation (`neo-tree.nvim`).
  - Git integration (`gitsigns.nvim`).
  - Syntax highlighting (`nvim-treesitter`).
  - Status line (`lualine.nvim`).
  - Buffer management (`harpoon`).
  - Color theme (`tokyonight.nvim`).
  - And others like `which-key.nvim`, `todo-comments.nvim`, `mini.nvim`, `conform.nvim` (formatting), `oil.nvim` (file explorer).
- Configures Python LSP server (`pyright`) with specific settings.
- Sets up custom keymaps for Harpoon (buffer navigation).
- Includes customizations for HTML/Jinja file types.
- Enables autoread for files.

### Hyprland (`~/.config/hypr/`)

- `autostart.conf`: Configures autostart processes, including creating a headless output and starting `wayvnc`.
- `monitors.conf`: Configures monitor settings, including a headless monitor likely used for the VNC connection to a tablet. Sets `GDK_SCALE=2` for high DPI displays.

## Setup Scripts

### `setup.sh`

- A Bash script intended for Arch Linux.
- Updates the package database.
- Installs a predefined list of packages including `wayvnc`, `android-tools`, `tmux`, `zsh`, `youtube-music-bin`, `brave-bin`, `uv`, `nvm`, and `qwen-code`.
- Installs Oh My Zsh unattended.
- Clones and installs Oh My Zsh plugins (`zsh-autosuggestions`, `zsh-syntax-highlighting`).
- Configures the `.zshrc` file to use these plugins.
- Clones TPM (Tmux Plugin Manager).
- Changes the default shell to Zsh.

### `setup-pt2.sh` (not read, but likely a continuation)

- Presumably continues the setup process, possibly installing AUR helpers, additional tools, or performing post-installation configuration steps.

### `run-second-monitor.sh`

- A Zsh script intended to be run when a secondary device (specifically mentioned as a Xiaomi tablet in the log output) is connected.
- Starts the ADB server.
- Sets up ADB port reversal for VNC (`tcp:5900`).
- Logs the connection event.

## Usage

1.  Clone the repository to your home directory (or desired location).
2.  Review the configuration files (`.zshrc`, `.tmux.conf`, `~/.config/nvim/init.lua`, `~/.config/hypr/*.conf`) to ensure they suit your needs.
3.  Run the `setup.sh` script to install packages and set up Oh My Zsh/Tmux.
4.  Run the `setup-pt2.sh` script for further setup (if applicable).
5.  Symlink the configuration files to their respective locations (this step might be manual or handled by a separate script not included here). For example:
    ```bash
    ln -sf ~/dotfiles/.zshrc ~/.zshrc
    ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
    ln -sf ~/dotfiles/.config/nvim ~/.config/nvim
    ln -sf ~/dotfiles/.config/hypr ~/.config/hypr
    ```
6.  Start a new Zsh session or source the `.zshrc` file (`source ~/.zshrc`).
7.  In Tmux, press `Prefix + I` (where `Prefix` is `Ctrl-s` as configured) to install TPM plugins.
8.  Launch Neovim (`nvim`) and run `:Lazy` to install Neovim plugins.