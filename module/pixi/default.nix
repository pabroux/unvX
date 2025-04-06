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
        PATH=/opt/homebrew/bin:$PATH
        if [[ -v DRY_RUN ]]; then
          echo 'pixi config set change-ps1 false'
        else
          pixi config set change-ps1 false
        fi
      )";
  };
}
