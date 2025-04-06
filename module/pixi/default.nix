{
  config,
  pkgs,
  ...
}: {
  home.packages = [
    pkgs.pixi
  ];
}
