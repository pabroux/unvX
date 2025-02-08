{
  config,
  pkgs,
  unvX,
  ...
}: {
  home.file = {
    "zsh/.zshrc" = {
      source = config.lib.file.mkOutOfStoreSymlink "${unvX.directory.module}/zsh/zshrc";
      target = ".zshrc";
    };
  };
}
