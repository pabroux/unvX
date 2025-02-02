<p align="center">
  <img width=275 src="https://github.com/user-attachments/assets/72b67ecd-8e96-4733-9a6f-f0e32e13f817">
</p>
<p align="center">
  <b>A simple Home Manager configuration</b>
</p>
<p align="center">
  <a href="https://github.com//Sulfyderz/unvX/blob/master/LICENSE">
    <img src="https://img.shields.io/github/license/Sulfyderz/unvX.svg" alt="License Badge">
  </a>
</p>


## About 
unvX is a [Home Manager](https://github.com/nix-community/home-manager) configuration for installing software and managing dotfiles without using [Nix flakes](https://nix.dev/concepts/flakes#why-are-flakes-controversial). It employs symlinks for dotfile management, allowing immediate feedback on any changes made without generating additional files from Nix sources.

> [!IMPORTANT]
> unvX serves as a source of inspiration. The `module` folder contains Nix modules, each dedicated to a specific software. These modules handle both the installation and configuration of the software and its extensions. The `host` folder includes Home Manager entry points for individual machines, specifying which module to use.

> [!NOTE]
> Since [Homebrew](https://brew.sh) is better suited to install applications for macOS (e.g. [Raycast](https://www.raycast.com)), a Nix module using it behind the scenes is available in the `module` folder. Thus, you don't have to worry about managing two commands to update everything.

> [!NOTE]
> Currently, there is only an entry point for a macOS machine (i.e. the <code>host/macbook/home.nix</code> file). More to come.

## Install
To install, use the following command inside the unvX repository:
```
./install
```

<details><summary>Detailed explanation</summary>

This command will install [Homebrew](https://brew.sh), [Nix](https://nixos.org) and [Home Manager](https://github.com/nix-community/home-manager) if they are not yet installed. Additionally, it will configure your Git Hooks to invoke [pre-commit](https://pre-commit.com) using Nix. Lastly, it will link a Home Manager entry point (i.e. the `host/macbook/home.nix` file) regardless of the location of your unvX repository.

</details>

## Usage
As any [Home Manager](https://github.com/nix-community/home-manager) configuration, call the following command to apply it:
```
home-manager switch
```
