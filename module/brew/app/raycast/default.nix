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
        reply=n
        while :; do
          echo -n 'Do you want to import raycast config? [y/N]: '
          if ! read -r reply; then
            [ ! -t 0 ] && echo
            reply=n
            break
          fi
          if [[ -z $reply || $reply =~ ^[YyNn]$ ]]; then
            break
          fi
          echo \"Please answer 'y' or 'n' (or press Enter for the default, n).\"
        done
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
