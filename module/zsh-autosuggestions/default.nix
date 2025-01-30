{
  config,
  pkgs,
  ...
}: {
  home.packages = [
    pkgs.zsh-autosuggestions
  ];
}
