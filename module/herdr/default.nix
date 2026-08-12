{
  config,
  pkgs,
  unvX,
  ...
}: {
  home.packages = [
    pkgs.herdr
  ];

  home.file = {
    "herdr/config.toml" = {
      source = config.lib.file.mkOutOfStoreSymlink "${unvX.directory.module}/herdr/config.toml";
      target = ".config/herdr/config.toml";
    };
  };
}
