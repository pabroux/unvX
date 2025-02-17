{
  config,
  pkgs,
  lib,
  ...
}: {
  home.activation = {
    setupMiniconda =
      lib.hm.dag.entryAfter ["installHomebrewCasks"]
      "(
        PATH=/opt/homebrew/bin:$PATH
        if [[ -v DRY_RUN ]]; then
          echo 'conda config --set auto_activate_base false'
          echo 'conda config --set changeps1 false'
        else
          conda config --set auto_activate_base false
          conda config --set changeps1 false
        fi
      )";
  };
}
