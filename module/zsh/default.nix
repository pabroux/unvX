{
  config,
  pkgs,
  unvx,
  ...
}: {
  home.file = {
    "zsh/.zshrc" = {
      source = config.lib.file.mkOutOfStoreSymlink "${unvx.directory.module}/zsh/zshrc";
      target = ".zshrc";
    };
  };
}
