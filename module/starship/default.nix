{
  config,
  pkgs,
  unvx,
  ...
}: {
  home.packages = [
    pkgs.starship
  ];

  home.file = {
    "starship/starship.toml" = {
      source = config.lib.file.mkOutOfStoreSymlink "${unvx.directory.module}/starship/starship.toml";
      target = ".config/starship/starship.toml";
    };
  };
}
