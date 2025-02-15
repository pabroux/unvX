{
  config,
  pkgs,
  ...
}: {
  home.packages = [
    pkgs.ripgrep
  ];
}
