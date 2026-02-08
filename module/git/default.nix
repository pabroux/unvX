{
  config,
  pkgs,
  unvX,
  ...
}: {
  home.packages = [
    pkgs.git-filter-repo
    pkgs.git-lfs
  ];

  home.file = {
    "git/config" = {
      source = config.lib.file.mkOutOfStoreSymlink "${unvX.directory.module}/git/config";
      target = ".config/git/config";
    };
    "git/ignore" = {
      source = config.lib.file.mkOutOfStoreSymlink "${unvX.directory.module}/git/ignore";
      target = ".config/git/ignore";
    };
  };
}
