# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

unvX is a standalone Home Manager configuration using Nix flakes to manage dotfiles and software installation on macOS. It uses symlinks for dotfile management, enabling immediate feedback on configuration changes.

## Commands

**Apply configuration:**
```bash
home-manager switch
```

**First-time installation:**
```bash
./install                           # Setup git hooks, generate unvX.nix, link flakes
nix run home-manager -- switch      # Initial Home Manager installation
```

**Development shell (provides formatters and pre-commit tools):**
```bash
nix develop
```

**Run pre-commit checks:**
```bash
nix develop . -c pre-commit run -a
```

**Formatters:**
- Nix: `alejandra`
- Shell: `shfmt`
- Lua: `stylua`
- YAML: `yamlfmt`

## Architecture

### Entrypoint Flow
```
flake.nix → reads unvX.nix → host/<hostname>/user/<user>/home.nix → imports module/*/default.nix
```

### Key Directories

- **`flake.nix`**: Defines inputs (nixpkgs, home-manager), outputs (home configurations), and dev shell
- **`host/`**: Host-specific Home Manager profiles. Matches `$USER@$(hostname)` or falls back to `$USER`
- **`module/`**: Self-contained Nix modules for each software (package installation, config symlinking, activation hooks)
- **`unvX.nix`**: Generated file containing installation paths, passed to all modules as `unvX` attribute

### Module Pattern

Each module in `module/<name>/default.nix` follows this structure:
1. Declares packages via `home.packages`
2. Symlinks config files using `mkOutOfStoreSymlink` to XDG paths (`~/.config/`)
3. Optionally runs activation hooks for post-install scripts

Example symlink pattern:
```nix
home.file."<app>/<config>".source = mkOutOfStoreSymlink "${unvX.directory.module}/<module>/<config>";
```

### Dynamic Loading

Some modules dynamically load content from directories:
- **neovim**: Reads all `.lua` files from `neovim/lua/plugins/`
- **homebrew**: Conditionally imports app-specific configs from subdirectories

### Hybrid Environment Strategy

- **Nix (unvX)**: Foundation tools (shell, editor, git, tmux)
- **Mise**: Per-directory runtime versions (Node, Python, Go)
- **Homebrew**: macOS GUI applications (managed via homebrew module)

## Conventions

- **Commits**: Conventional Commits format enforced via gitlint (`<type>(<scope>): <subject>`)
- **Pre-commit hooks**: alejandra, shfmt, stylua, yamlfmt, gitlint, gitleaks
