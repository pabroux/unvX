{
  config,
  pkgs,
  ...
}: {
  home.packages = [
    pkgs.uv
  ];
}
