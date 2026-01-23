{
  config,
  pkgs,
  ...
}: {
  home.packages = [
    pkgs.mise
  ];
}
