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
unvX is a [Home Manager](https://github.com/nix-community/home-manager) configuration for installing software and managing dotfiles without using Nix flakes. It employs symlinks for dotfile management, allowing immediate feedback on any changes made without generating additional files from Nix sources.

> [!NOTE]
> Currently, it is a configuration for macOS only. Since [Homebrew](https://brew.sh) is better suited to install applications for that OS (e.g. [Raycast](https://www.raycast.com)), that configuration uses it in the background. Thus, you don't have to worry about managing two commands to update everything.

## Install
To install, use the following command inside the unvX repository:
```
./install
```

<details><summary>Detailed explanation</summary>

This command will install [Homebrew](https://brew.sh), [Nix](https://nixos.org) and [Home Manager](https://github.com/nix-community/home-manager) if they are not yet installed. Additionally, it will configure your Git Hooks with [pre-commit](https://pre-commit.com).  Lastly, it will link your Home Manager configuration (i.e. the <code>host/macbook/home.nix</code> file) regardless of the location of your unvX repository.

</details>

## Usage
As any [Home Manager](https://github.com/nix-community/home-manager) configuration, call the following command to apply it:
```
home-manager switch
```
