{
  config,
  pkgs,
  unvx,
  ...
}: {
  home.packages = [
    pkgs.herdr
  ];

  home.file = {
    "herdr/config.toml" = {
      source = config.lib.file.mkOutOfStoreSymlink "${unvx.directory.module}/herdr/config.toml";
      target = ".config/herdr/config.toml";
    };
  };
}
