# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Personal dotfiles managed with **GNU Stow**. Running `stow .` from the repo root creates symlinks for all package directories into `~/`.

## Installation

```bash
# Install all dotfiles (symlink everything to ~/)
./install.sh   # equivalent to: stow .

# Install a single package
stow zsh       # only symlink zsh configs

# Remove symlinks
stow -D zsh
```

## Repository Structure

Each top-level directory is a Stow package. Its internal layout mirrors the home directory:
- `zsh/.zshrc` → `~/.zshrc`
- `nvim/.config/nvim/init.lua` → `~/.config/nvim/init.lua`

### Packages

| Directory | Tool | Key files |
|-----------|------|-----------|
| `zsh/` | Shell (Zsh + Powerlevel10k) | `.zshrc`, `.zshenv`, `.zprofile`, `.p10k.zsh` |
| `nvim/` | Neovim (LazyVim framework) | `.config/nvim/` — `init.lua`, `lua/config/`, `lua/plugins/` |
| `tmux/` | Tmux + TPM | `.config/tmux/tmux.conf` |
| `wezterm/` | WezTerm terminal | `.wezterm.lua` |
| `ghostty/` | Ghostty terminal (Catppuccin Mocha) | `.config/ghostty/config` |
| `aerospace/` | AeroSpace window manager (macOS) | `.aerospace.toml` |
| `zed/` | Zed editor | `.config/zed/settings.json`, `keymap.json` |
| `opencode/` | OpenCode | `.config/opencode/opencode.jsonc` |
| `jupyter/` | JupyterLab | `.jupyter/` |
| `htop/` | htop | `.config/htop/htoprc` |
| `ssh-agent/` | SSH agent systemd service | `.config/systemd/` |

## Neovim Configuration

Uses **LazyVim** as the base framework. Custom plugin specs live in `nvim/.config/nvim/lua/plugins/`. Key plugins configured:
- `blink.lua` — completion
- `colorscheme.lua` — theme
- `flutter-tools.lua` — Flutter/Dart
- `snacks.lua`, `toggleterm.lua`, `edgy.lua`

Keymaps, options, and autocmds are in `nvim/.config/nvim/lua/config/`.

## Zsh Notes

`.zshrc` has platform-specific sections (macOS vs Linux), including:
- Homebrew, Ruby, Flutter, Go, NVM path exports
- Conda initialization
- `fabric` alias for the Fabric AI tool
- Powerlevel10k instant-prompt block at the top (must stay first)

## Tmux Plugins

TPM (Tmux Plugin Manager) must be installed separately. After installing TPM, press `Ctrl+I` inside a tmux session to install plugins (`tmux-resurrect`, `tmux-continuum`).
