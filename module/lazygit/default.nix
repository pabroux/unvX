{
  config,
  pkgs,
  unvX,
  ...
}: {
  home.packages = [
    pkgs.lazygit
  ];

  home.file = {
    "lazygit/config.yml" = {
      source = config.lib.file.mkOutOfStoreSymlink "${unvX.directory.module}/lazygit/config.yml";
      target = ".config/lazygit/config.yml";
    };
  };
}
