{
  config,
  pkgs,
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
      source = config.lib.file.mkOutOfStoreSymlink ./tmux.conf;
      target = ".config/tmux/tmux.conf";
    };
  };
}
