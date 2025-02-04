{
  config,
  pkgs,
  ...
}: {
  home.packages = [
    pkgs.gh
  ];

  home.file = {
    "github-cli/config.yml" = {
      source = config.lib.file.mkOutOfStoreSymlink ./config.yml;
      target = ".config/gh/config.yml";
    };
    "github-cli/hosts.yml" = {
      source = config.lib.file.mkOutOfStoreSymlink ./hosts.yml;
      target = ".config/gh/hosts.yml";
    };
  };
}
