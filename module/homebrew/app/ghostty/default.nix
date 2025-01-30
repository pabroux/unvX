{
  config,
  pkgs,
  lib,
  ...
}: {
  home.file = {
    "config" = {
      source = config.lib.file.mkOutOfStoreSymlink ./config;
      target = ".config/ghostty/config";
    };
  };
}
