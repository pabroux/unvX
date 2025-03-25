{
  config,
  pkgs,
  lib,
  unvX,
  ...
}: {
  home.packages = [
    pkgs.yazi
  ];

  home.file = {
    "yazi/init.lua" = {
      source = config.lib.file.mkOutOfStoreSymlink "${unvX.directory.module}/yazi/init.lua";
      target = ".config/yazi/init.lua";
    };
    "yazi/keymap.toml" = {
      source = config.lib.file.mkOutOfStoreSymlink "${unvX.directory.module}/yazi/keymap.toml";
      target = ".config/yazi/keymap.toml";
    };
    "yazi/theme.toml" = {
      source = config.lib.file.mkOutOfStoreSymlink "${unvX.directory.module}/yazi/theme.toml";
      target = ".config/yazi/theme.toml";
    };
    "yazi/yazi.toml" = {
      source = config.lib.file.mkOutOfStoreSymlink "${unvX.directory.module}/yazi/yazi.toml";
      target = ".config/yazi/yazi.toml";
    };
  };

  home.activation = {
    installYaziPlugins =
      lib.hm.dag.entryAfter ["writeBoundary"]
      "(
        PATH=$HOME/.nix-profile/bin:$PATH
        if [[ -v DRY_RUN ]]; then
          echo \"ya pack -a yazi-rs/plugins:full-border &> /dev/null\"
          echo \"ya pack -u &> /dev/null\"
        elif [[ -v VERBOSE ]]; then
          ya pack -a yazi-rs/plugins:full-border
          ya pack -u
        else
          ya pack -a yazi-rs/plugins:full-border &> /dev/null
          ya pack -u &> /dev/null
        fi
      )";
  };
}
