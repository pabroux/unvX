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
    "yazi/plugins/full-border.yazi" = {
      source = pkgs.yaziPlugins.full-border;
      target = ".config/yazi/plugins/full-border.yazi";
    };
  };
}
