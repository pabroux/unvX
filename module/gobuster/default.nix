{
  config,
  pkgs,
  ...
}: {
  home.packages = [
    pkgs.gobuster
  ];
}
