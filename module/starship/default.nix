{
  config,
  pkgs,
  unvX,
  ...
}: {
  home.packages = [
    pkgs.starship
  ];

  home.file = {
    "starship/starship.toml" = {
      source = config.lib.file.mkOutOfStoreSymlink "${unvX.directory.module}/starship/starship.toml";
      target = ".config/starship/starship.toml";
    };
  };
}
