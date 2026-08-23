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
        PATH=$HOME/.nix-profile/bin:/usr/bin:/bin:$PATH
        reply=n
        while :; do
          echo -n 'Do you want to setup the yabai scripting addition (superuser privileges required)? [y/N]: '
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
            echo 'echo \"$(whoami) ALL=(root) NOPASSWD: sha256:$(shasum -a 256 $(which yabai) | cut -d ' ' -f 1) $(which yabai) --load-sa\" | sudo tee /private/etc/sudoers.d/yabai > /dev/null'
          else
            echo \"$(whoami) ALL=(root) NOPASSWD: sha256:$(shasum -a 256 $(which yabai) | cut -d ' ' -f 1) $(which yabai) --load-sa\" | sudo tee /private/etc/sudoers.d/yabai > /dev/null
          fi
        fi
      )";
  };
}
