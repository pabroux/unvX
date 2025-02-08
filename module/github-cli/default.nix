{
  config,
  pkgs,
  unvX,
  ...
}: {
  home.packages = [
    pkgs.gh
  ];

  home.file = {
    "github-cli/config.yml" = {
      source = config.lib.file.mkOutOfStoreSymlink "${unvX.directory.module}/github-cli/config.yml";
      target = ".config/gh/config.yml";
    };
    "github-cli/hosts.yml" = {
      source = config.lib.file.mkOutOfStoreSymlink "${unvX.directory.module}/github-cli/hosts.yml";
      target = ".config/gh/hosts.yml";
    };
  };
}
