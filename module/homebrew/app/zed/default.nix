{
  config,
  pkgs,
  lib,
  unvX,
  ...
}: {
  home.file = {
    "zed/settings.json" = {
      source = config.lib.file.mkOutOfStoreSymlink "${unvX.directory.module}/homebrew/app/zed/settings.json";
      target = ".config/zed/settings.json";
    };
  };
}
