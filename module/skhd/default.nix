{
  config,
  pkgs,
  unvx,
  ...
}: {
  home.packages = [
    pkgs.skhd
  ];

  home.file = {
    "skhd/skhdrc" = {
      source = config.lib.file.mkOutOfStoreSymlink "${unvx.directory.module}/skhd/skhdrc";
      target = ".config/skhd/skhdrc";
    };
  };
}
