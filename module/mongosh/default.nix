{
  config,
  pkgs,
  lib,
  ...
}: {
  home.packages = [
    pkgs.mongosh
  ];
}
