{
  config,
  pkgs,
  lib,
  unvx,
  ...
}: {
  home.file = {
    "vim/vimrc" = {
      source = config.lib.file.mkOutOfStoreSymlink "${unvx.directory.module}/vim/vimrc";
      target = ".config/vim/vimrc";
    };
    "vim/colors/unvx.vim" = {
      source = config.lib.file.mkOutOfStoreSymlink "${unvx.directory.module}/vim/colors/unvx.vim";
      target = ".config/vim/colors/unvx.vim";
    };
    "vim/autoload/lightline/colorscheme/unvx.vim" = {
      source = config.lib.file.mkOutOfStoreSymlink "${unvx.directory.module}/vim/autoload/lightline/colorscheme/unvx.vim";
      target = ".config/vim/autoload/lightline/colorscheme/unvx.vim";
    };
    "vim/pack/nix/start/lightline.vim" = {
      source = pkgs.vimPlugins.lightline-vim;
      target = ".local/share/vim/pack/nix/start/lightline.vim";
    };
    "vim/pack/nix/start/vim-commentary" = {
      source = pkgs.vimPlugins.vim-commentary;
      target = ".local/share/vim/pack/nix/start/vim-commentary";
    };
  };
}
