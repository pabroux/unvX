{
  config,
  pkgs,
  unvX,
  ...
}: {
  home.packages = [
    pkgs.lazydocker
  ];

  home.file = {
    "lazydocker/config.yml" = {
      source = config.lib.file.mkOutOfStoreSymlink "${unvX.directory.module}/lazydocker/config.yml";
      target = ".config/lazydocker/config.yml";
    };
  };
}
