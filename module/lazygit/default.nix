{
  config,
  pkgs,
  unvx,
  ...
}: {
  home.packages = [
    pkgs.lazygit
  ];

  home.file = {
    "lazygit/config.yml" = {
      source = config.lib.file.mkOutOfStoreSymlink "${unvx.directory.module}/lazygit/config.yml";
      target = ".config/lazygit/config.yml";
    };
  };
}
