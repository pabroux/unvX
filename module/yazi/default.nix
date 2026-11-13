{
  config,
  pkgs,
  lib,
  unvx,
  ...
}: let
  linkFile = files:
    builtins.listToAttrs (map (file: {
        name = "yazi/${file}";
        value = {
          source = config.lib.file.mkOutOfStoreSymlink "${unvx.directory.module}/yazi/${file}";
          target = ".config/yazi/${file}";
        };
      })
      files);
in {
  home.packages = [
    pkgs.yazi
  ];

  home.file =
    linkFile [
      "init.lua"
      "keymap.toml"
      "theme.toml"
      "yazi.toml"
    ]
    // {
      "yazi/plugins/full-border.yazi" = {
        source = pkgs.yaziPlugins.full-border;
        target = ".config/yazi/plugins/full-border.yazi";
      };
    };
}
