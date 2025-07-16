{
  config,
  pkgs,
  ...
}: {
  home.packages = [
    pkgs.postgresql
  ];
}
