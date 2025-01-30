{
  config,
  pkgs,
  ...
}: {
  home.file = {
    ".zshrc" = {
      source = config.lib.file.mkOutOfStoreSymlink ./.zshrc;
    };
  };
}
