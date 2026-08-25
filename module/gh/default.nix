{
  config,
  pkgs,
  unvX,
  ...
}: let
  linkFile = files:
    builtins.listToAttrs (map (file: {
        name = "gh/${file}";
        value = {
          source = config.lib.file.mkOutOfStoreSymlink "${unvX.directory.module}/gh/${file}";
          target = ".config/gh/${file}";
        };
      })
      files);
in {
  home.packages = [
    pkgs.gh
  ];

  home.file = linkFile [
    "config.yml"
    "hosts.yml"
  ];
}
