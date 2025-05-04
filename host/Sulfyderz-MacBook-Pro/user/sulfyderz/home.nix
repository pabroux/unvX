{
  config,
  pkgs,
  lib,
  ...
}: let
  modules = [
    "coreutils"
    "deno"
    "fzf"
    "git"
    "github-cli"
    "homebrew"
    "htop"
    "lazydocker"
    "lazygit"
    "minikube"
    "neovim"
    "nodejs"
    "ollama"
    "pixi"
    "ripgrep"
    "skhd"
    "starship"
    "tmux"
    "uv"
    "vim"
    "yabai"
    "yazi"
    "zoxide"
    "zsh"
    "zsh-autosuggestions"
  ];
in {
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "sulfyderz";
  home.homeDirectory = "/Users/sulfyderz";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  imports = map (x: ../../../../module + "/${x}") modules;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
