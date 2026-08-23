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
    "gh/config.yml" = {
      source = config.lib.file.mkOutOfStoreSymlink "${unvX.directory.module}/gh/config.yml";
      target = ".config/gh/config.yml";
    };
    "gh/hosts.yml" = {
      source = config.lib.file.mkOutOfStoreSymlink "${unvX.directory.module}/gh/hosts.yml";
      target = ".config/gh/hosts.yml";
    };
  };
}
