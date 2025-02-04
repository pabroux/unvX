{
  config,
  pkgs,
  ...
}: {
  home.packages = [
    pkgs.skhd
  ];

  home.file = {
    "skhd/skhdrc" = {
      source = config.lib.file.mkOutOfStoreSymlink ./skhdrc;
      target = ".config/skhd/skhdrc";
    };
  };
}
