{
  config,
  pkgs,
  unvX,
  ...
}: let
  linkFile = files:
    builtins.listToAttrs (map (file: {
        name = "git/${file}";
        value = {
          source = config.lib.file.mkOutOfStoreSymlink "${unvX.directory.module}/git/${file}";
          target = ".config/git/${file}";
        };
      })
      files);
in {
  home.packages = [
    pkgs.git-filter-repo
    pkgs.git-lfs
  ];

  home.file = linkFile [
    "config"
    "ignore"
  ];
}
