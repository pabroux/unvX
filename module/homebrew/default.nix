{
  config,
  pkgs,
  lib,
  ...
}: let
  casks = [
    "discord"
    "docker"
    "edrawmind"
    "figma"
    "font-sf-mono"
    "ghostty"
    "gimp"
    "keepassxc"
    "linear-linear"
    "logi-options+"
    "notion"
    "nvidia-geforce-now"
    "obsidian"
    "onyx"
    "raycast"
    "slack"
    "spotify"
    "sublime-text"
    "visual-studio-code"
    "whatsapp"
    "zed"
  ];
in {
  imports = builtins.filter (caskConfigDir: builtins.pathExists caskConfigDir) (map (caskConfigDir: ./. + "/app/${caskConfigDir}") casks);

  home.activation = {
    installHomebrewCasks =
      lib.hm.dag.entryAfter ["installPackages"]
      (
        (
          cask: "(
                  PATH=/opt/homebrew/bin:$PATH
                  if [[ -v DRY_RUN ]]; then
                    echo 'brew install --cask ${cask}'
                  elif [[ -v VERBOSE ]]; then
                    brew install --cask ${cask}
                  else
                    brew install --quiet --cask ${cask} &> /dev/null
                  fi
                )"
        )
        (lib.strings.concatStringsSep " " casks)
      );
  };
}
