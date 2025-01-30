{
  config,
  pkgs,
  ...
}: {
  home.packages = [
    pkgs.zoxide
  ];
}
