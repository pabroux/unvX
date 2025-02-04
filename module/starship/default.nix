{
  config,
  pkgs,
  ...
}: {
  home.packages = [
    pkgs.starship
  ];

  home.file = {
    "starship/starship.toml" = {
      source = config.lib.file.mkOutOfStoreSymlink ./starship.toml;
      target = ".config/starship/starship.toml";
    };
  };
}
