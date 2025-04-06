{
  config,
  pkgs,
  lib,
  ...
}: {
  home.packages = [
    pkgs.pixi
  ];

  home.activation = {
    setupPixi =
      lib.hm.dag.entryAfter ["installPackages"]
      "(
        PATH=$HOME/.nix-profile/bin:/usr/bin:/bin:$PATH
        if [[ -v DRY_RUN ]]; then
          echo 'pixi config set shell.change-ps1 false'
        elif [[ -v VERBOSE ]]; then
          pixi config set shell.change-ps1 false
        else
          pixi config set shell.change-ps1 false &> /dev/null
        fi
      )";
  };
}
