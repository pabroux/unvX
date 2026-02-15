{
  config,
  pkgs,
  ...
}: {
  home.packages = [
    pkgs.nodejs
  ];
}
