{
  config,
  pkgs,
  lib,
  ...
}: {
  home.packages = [
    pkgs.awscli2
  ];
}
