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
        if [[ \" \${UNVX_FORCE-} \" == *\" raycast \"* || ! -d \"$HOME/Library/Application Support/com.raycast.macos\" ]]; then
          run open ${toString (./. + "/raycast.rayconfig")}
        fi
      )";
  };
}
