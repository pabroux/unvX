{
  config,
  pkgs,
  ...
}: {
  home.packages = [
    pkgs.fd
  ];
}
