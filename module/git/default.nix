{
  config,
  pkgs,
  ...
}: {
  home.packages = [
    pkgs.git-filter-repo
    pkgs.git-lfs
  ];

  home.file = {
    "gitconfig" = {
      source = config.lib.file.mkOutOfStoreSymlink ./gitconfig;
      target = ".config/git/gitconfig";
    };
  };
}
