{
  config,
  pkgs,
  ...
}: {
  home.file = {
    "zsh/.zshrc" = {
      source = config.lib.file.mkOutOfStoreSymlink ./.zshrc;
      target = ".zshrc";
    };
  };
}
