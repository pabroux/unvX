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
    "git/gitconfig" = {
      source = config.lib.file.mkOutOfStoreSymlink "${unvX.directory.module}/git/gitconfig";
      target = ".config/git/gitconfig";
    };
  };
}
