# <img width="20" height="20" src="https://gitlab.com/uploads/-/system/project/avatar/64765455/pulsar.png?width=96" alt="Banner"> unvX


## About 
unvX is a [Home Manager](https://github.com/nix-community/home-manager) configuration for installing software and managing dotfiles using Nix modules instead of flakes. It employs symlinks for dotfile management, allowing immediate feedback on any changes made without generating additional files from Nix sources.

<details><summary>ℹ️ Note</summary>
Currently, it is only focused for macOS. Since [Homebrew](https://brew.sh) is better suited to install applications (e.g. Raycast) for that OS, unvX uses it in the background. Thus, you don't have to worry about managing two commands to update everything.
</details>

## Install
To install, use the following command inside the unvX repository:
```
❯ ./install
```
<details><summary>Detailed explanation</summary>
This command will install [Homebrew](https://brew.sh), [Nix](https://nixos.org) and [Home Manager](https://github.com/nix-community/home-manager) if they are not yet installed. It will also link your Home Manager configuration (i.e. the `host/macbook/home.nix` file) no matter where your repository is.
</details>

## Usage
As any [Home Manager](https://github.com/nix-community/home-manager) configuration, call the following command to apply it:
```
❯ home-manager switch
```