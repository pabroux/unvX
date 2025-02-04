{
  config,
  pkgs,
  lib,
  ...
}: {
  home.file = {
    "ghostty/config" = {
      source = config.lib.file.mkOutOfStoreSymlink ./config;
      target = ".config/ghostty/config";
    };
  };
}
