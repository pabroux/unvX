{
  config,
  pkgs,
  unvX,
  ...
}: {
  home.packages = [
    pkgs.skhd
  ];

  home.file = {
    "skhd/skhdrc" = {
      source = config.lib.file.mkOutOfStoreSymlink "${unvX.directory.module}/skhd/skhdrc";
      target = ".config/skhd/skhdrc";
    };
  };
}
