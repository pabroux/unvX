{
  config,
  pkgs,
  ...
}: {
  home.packages = [
    pkgs.minikube
  ];
}
