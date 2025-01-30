{
  config,
  pkgs,
  ...
}: {
  home.packages = [
    pkgs.coreutils-prefixed
  ];
}
