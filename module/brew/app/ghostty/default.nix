{
  config,
  pkgs,
  lib,
  unvx,
  ...
}: {
  home.file = {
    "ghostty/config" = {
      source = config.lib.file.mkOutOfStoreSymlink "${unvx.directory.module}/brew/app/ghostty/config";
      target = ".config/ghostty/config";
    };
  };
}
