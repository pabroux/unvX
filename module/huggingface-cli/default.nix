{
  config,
  pkgs,
  lib,
  ...
}: {
  home.packages = [
    pkgs.python312Packages.huggingface-hub
  ];
}
