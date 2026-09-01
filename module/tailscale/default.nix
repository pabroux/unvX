{
  config,
  pkgs,
  ...
}: {
  home.packages = [
    pkgs.tailscale
  ];
}
