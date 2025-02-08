{
  config,
  pkgs,
  unvX,
  ...
}: {
  home.packages = [
    pkgs.tmux
    pkgs.tmuxPlugins.resurrect
    pkgs.tmuxPlugins.tmux-nova
    pkgs.tmuxPlugins.yank
  ];

  home.file = {
    "tmux/tmux.conf" = {
      source = config.lib.file.mkOutOfStoreSymlink "${unvX.directory.module}/tmux/tmux.conf";
      target = ".config/tmux/tmux.conf";
    };
  };
}
