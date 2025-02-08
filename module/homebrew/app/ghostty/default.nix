{
  config,
  pkgs,
  lib,
  unvX,
  ...
}: {
  home.file = {
    "ghostty/config" = {
      source = config.lib.file.mkOutOfStoreSymlink "${unvX.directory.module}/homebrew/app/ghostty/config";
      target = ".config/ghostty/config";
    };
  };
}
