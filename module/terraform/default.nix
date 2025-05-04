{
  config,
  pkgs,
  lib,
  ...
}: {
  home.packages = [
    pkgs.terraform
  ];
}
