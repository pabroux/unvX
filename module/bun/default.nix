{
  config,
  pkgs,
  ...
}: {
  home.packages = [
    pkgs.bun
  ];
}
