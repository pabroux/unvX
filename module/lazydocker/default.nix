{
  config,
  pkgs,
  unvx,
  ...
}: {
  home.packages = [
    pkgs.lazydocker
  ];

  home.file = {
    "lazydocker/config.yml" = {
      source = config.lib.file.mkOutOfStoreSymlink "${unvx.directory.module}/lazydocker/config.yml";
      target = ".config/lazydocker/config.yml";
    };
  };
}
