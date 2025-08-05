<p align="center">
  <img width=275 src="https://github.com/user-attachments/assets/e57a9184-5af4-4694-9b88-c7a099d51f6a">
</p>
<p align="center">
  <b>A simple Home Manager configuration</b>
</p>
<p align="center">
  <a href="https://github.com/pabroux/unvX/blob/master/LICENSE">
    <picture>
      <img src="https://img.shields.io/github/license/pabroux/unvX.svg?label=Licence" alt="License Badge">
    </picture>
  </a>
  <a href="https://github.com/pabroux/unvX/actions/workflows/ci.yml">
    <picture>
      <img src="https://github.com/pabroux/unvX/actions/workflows/ci.yml/badge.svg" alt="CI Badge">
    </picture>
  </a>
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

## Resources
Useful resources to learn Nix:

- [Nix language basics](https://nix.dev/tutorials/nix-language)
- [Packaging existing software with Nix](https://nix.dev/tutorials/packaging-existing-software)
- [Nix modules](https://nix.dev/tutorials/module-system/)
- [Nix flakes](https://zero-to-nix.com/concepts/flakes/)
