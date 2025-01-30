{
  config,
  pkgs,
  ...
}: {
  home.packages = [
    pkgs.ollama
  ];
}
