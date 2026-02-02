<p align="center">
  <img width=245 src="https://github.com/user-attachments/assets/e57a9184-5af4-4694-9b88-c7a099d51f6a">
</p>
<p align="center">
  <b>A simple Home Manager configuration</b>
</p>
<p align="center">
  <a href="https://conventionalcommits.org"><img src="https://img.shields.io/badge/Conventional%20Commits-1.0.0-%23FE5196?logo=conventionalcommits&logoColor=white" alt="Conventional Commits Badge"></a>
  <a href="https://github.com/pabroux/unvX/blob/master/LICENSE"><img src="https://img.shields.io/github/license/pabroux/unvX.svg?label=License" alt="License Badge"></a>
  <a href="https://github.com/pre-commit/pre-commit"><img src="https://img.shields.io/badge/pre--commit-enabled-green?logo=pre-commit" alt="pre-commit Badge"></a>
  <a href="https://github.com/pabroux/unvX/actions/workflows/ci.yml"><img src="https://github.com/pabroux/unvX/actions/workflows/ci.yml/badge.svg" alt="CI Badge"></a>
</p>

## About

unvX is a standalone [Home Manager](https://github.com/nix-community/home-manager) configuration using pure Nix flakes to install software and manage dotfiles. It employs symlinks for dotfile management, allowing immediate feedback on any change made.

> [!IMPORTANT]
> unvX serves as a source of inspiration. If it receives enough stars, I'll create a unvX builder tool to help you easily configure and manage your Home Manager.

## Table of contents

- [Requirements](#requirements)
- [Install](#install)
- [Usage](#usage)
- [Structure](#structure)
- [Recommendations](#recommendations)
- [Resources](#resources)

## Requirements

To use unvX, you will need:

- [Nix](https://nixos.org) with the Nix flake experimental feature enabled.

> [!TIP]
> Use the [Nix installer](https://github.com/DeterminateSystems/nix-installer) by Determinate Systems to install Nix with the Nix flake feature enabled by default.

## Install

To install, use the following command inside the unvX folder:
```
./install
```

> [!NOTE]
> This command will do three things:
> - Configure your Git Hooks to invoke [pre-commit](https://pre-commit.com) using Nix.
> - Generate a `unvX.nix` file.
> - Link the Home Manager flakes regardless of the location of your unvX folder.

## Usage

For first-time installation, call the following command:
```
nix run home-manager -- switch
```

> [!NOTE]
> This will make the `home-manager` command available system-wide and apply the Home Manager profile matching your machine.

Otherwise, as any Home Manager configuration, call the following command to apply the Home Manager profile matching your machine:
```
home-manager switch
```

## Structure

Here is a brief description of the structure:
- `flake.nix`: Entrypoint for profiles and Home Manager configurations. Home Manager will by default match first a `$USER@$(hostname)` profile. If not found, it will then default to a `$USER` profile.
- `host`: Home Manager configurations for specific machines and users, specifying which Nix module in the `module` folder to use.
- `module`: Nix modules dedicated to a specific software. These modules handle both the installation and configuration of the software and its extensions.
- `unvX.nix`: Generated during the installation, a file that contains information about your unvX installation, such as the unvX location on your host machine. The content of that file is configured to be read by Home Manager and to be passed into all your Nix module under the `unvX` attribute name. `unvX.nix` is mainly used to symlink your dotfiles.

> [!NOTE]
> Since [Homebrew](https://brew.sh) is better suited to install applications for macOS (e.g. [Raycast](https://www.raycast.com)), a `homebrew` Nix module using it behind the scenes is available in the `module` folder. Thus, you don't have to worry about managing two commands to update everything. If you plan to use the `homebrew` Nix module, make sure to have Homebrew installed.

## Recommendations

When configuring your environment, I recommend a hybrid approach:

- **Use unvX for foundations:** Install your essential, "always-on" tools here (e.g., zsh, git, neovim, tmux). If it shapes your shell behavior or OS integration, it belongs in your Home Manager configuration.

- **Use [Mise](https://mise.jdx.dev) for runtimes:** For project-specific languages (Node, Python, Go) that require frequent version switching, use Mise.

**Why?** Nix provides a rock-solid, reproducible base, but can feel rigid for rapid version hopping. Mise excels at managing dynamic per-directory runtimes, giving you the best of both worlds: a stable environment and developer agility.

> [!NOTE]
> A `mise` Nix module is available in the `module` folder. 

## Resources

Useful resources to learn Nix:

- [Nix language basics](https://nix.dev/tutorials/nix-language) by nix.dev
- [Packaging existing software with Nix](https://nix.dev/tutorials/packaging-existing-software) by nix.dev
- [Nix modules](https://nix.dev/tutorials/module-system/) by nix.dev
- [Nix flakes](https://zero-to-nix.com/concepts/flakes/) by Zero to Nix
