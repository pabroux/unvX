{
  config,
  pkgs,
  ...
}: {
  home.packages = [
    pkgs.deno
  ];
}
