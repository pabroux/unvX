{
  config,
  pkgs,
  ...
}: {
  home.packages = [
    pkgs.lazygit
  ];
}
