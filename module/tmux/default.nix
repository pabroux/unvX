{
  config,
  pkgs,
  lib,
  unvX,
  ...
}: let
  tmuxPlugins = with pkgs.tmuxPlugins; [resurrect tmux-nova yank];
in {
  home.packages = [pkgs.tmux];

  home.file = {
    "tmux/tmux.conf" = {
      source = config.lib.file.mkOutOfStoreSymlink "${unvX.directory.module}/tmux/tmux.conf";
      target = ".config/tmux/tmux.conf";
    };
    "tmux/plugins.conf" = {
      text = lib.concatMapStrings (plugin: "run-shell ${plugin.rtp}\n") tmuxPlugins;
      target = ".config/tmux/plugins.conf";
    };
  };
}
