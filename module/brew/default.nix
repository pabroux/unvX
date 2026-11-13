{
  config,
  pkgs,
  lib,
  ...
}: let
  casks = [
    "claude"
    "discord"
    "docker-desktop"
    "edrawmind"
    "figma"
    "font-sf-mono"
    "ghostty"
    "gimp"
    "herdr-app"
    "keepassxc"
    "linear"
    "logi-options+"
    "notion"
    "nvidia-geforce-now"
    "obsidian"
    "onyx"
    "raycast"
    "slack"
    "spotify"
    "sublime-text"
    "tailscale-app"
    "visual-studio-code"
    "whatsapp"
  ];
in {
  imports = builtins.filter (caskConfigDir: builtins.pathExists caskConfigDir) (map (caskConfigDir: ./. + "/app/${caskConfigDir}") casks);

  home.activation = {
    installHomebrewCasks =
      lib.hm.dag.entryAfter ["installPackages"]
      "(
        PATH=/opt/homebrew/bin:$PATH
        run --quiet env HOMEBREW_NO_INSTALL_UPGRADE=1 brew install --cask ${lib.strings.concatStringsSep " " casks}
        run --quiet env HOMEBREW_NO_UPGRADE_AUTO_UPDATES_CASKS=1 brew upgrade --cask
      )";
  };
}
