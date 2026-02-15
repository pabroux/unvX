{
  config,
  pkgs,
  lib,
  unvX,
  ...
}: {
  home.packages = [
    pkgs.claude-code
  ];

  home.file = {
    "claude/settings.json" = {
      source = config.lib.file.mkOutOfStoreSymlink "${unvX.directory.module}/claude-code/settings.json";
      target = ".config/claude/settings.json";
    };
  };
}
