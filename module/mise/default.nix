{
  config,
  pkgs,
  unvx,
  ...
}: {
  home.packages = [
    pkgs.mise
  ];

  home.file = {
    "mise/config.toml" = {
      source = config.lib.file.mkOutOfStoreSymlink "${unvx.directory.module}/mise/config.toml";
      target = ".config/mise/config.toml";
    };
  };
}
