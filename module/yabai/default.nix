{
  config,
  pkgs,
  lib,
  unvX,
  ...
}: {
  home.packages = [
    pkgs.yabai
  ];

  home.file = {
    "yabai/yabairc" = {
      source = config.lib.file.mkOutOfStoreSymlink "${unvX.directory.module}/yabai/yabairc";
      target = ".config/yabai/yabairc";
    };
  };

  home.activation = {
    setupYabai =
      lib.hm.dag.entryAfter ["installPackages"]
      "(
        PATH=/usr/bin:/bin:$PATH
        rule=\"$(whoami) ALL=(root) NOPASSWD: sha256:$(shasum -a 256 ${pkgs.yabai}/bin/yabai | cut -d ' ' -f 1) $HOME/.nix-profile/bin/yabai --load-sa\"
        if [[ \"$(cat /private/etc/sudoers.d/yabai 2> /dev/null)\" != \"$rule\" ]]; then
          echo \"$rule\" | run --quiet sudo tee /private/etc/sudoers.d/yabai
        fi
      )";
  };
}
