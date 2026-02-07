{
  config,
  pkgs,
  unvX,
  ...
}: {
  home.packages = [
    pkgs.mise
  ];

  home.file = {
    "mise/config.toml" = {
      source = config.lib.file.mkOutOfStoreSymlink "${unvX.directory.module}/mise/config.toml";
      target = ".config/mise/config.toml";
    };
  };
}
