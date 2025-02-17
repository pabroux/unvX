{
  config,
  pkgs,
  lib,
  ...
}: {
  home.activation = {
    setupRaycast =
      lib.hm.dag.entryAfter ["installHomebrewCasks"]
      "(
        PATH=/usr/bin:$PATH
        echo -n 'Do you want to import raycast config? [y/n]: '
        read -r reply
        [ ! -t 0 ] && echo
        if [[ $reply =~ ^[Yy]$ ]]; then
          if [[ -v DRY_RUN ]]; then
            echo 'open ${toString (./. + "/raycast.rayconfig")}'
          else
            open ${toString (./. + "/raycast.rayconfig")}
          fi
        fi
      )";
  };
}
