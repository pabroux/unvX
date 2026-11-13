{
  config,
  pkgs,
  unvx,
  ...
}: let
  linkFile = files:
    builtins.listToAttrs (map (file: {
        name = "git/${file}";
        value = {
          source = config.lib.file.mkOutOfStoreSymlink "${unvx.directory.module}/git/${file}";
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
