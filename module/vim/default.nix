{
  config,
  pkgs,
  lib,
  unvX,
  ...
}: {
  home.file = {
    "vim/vimrc" = {
      source = config.lib.file.mkOutOfStoreSymlink "${unvX.directory.module}/vim/vimrc";
      target = ".config/vim/vimrc";
    };
    "vim/pack/nix/start/lightline.vim" = {
      source = pkgs.vimPlugins.lightline-vim;
      target = ".local/share/vim/pack/nix/start/lightline.vim";
    };
    "vim/pack/nix/start/molokai" = {
      source = pkgs.vimPlugins.molokai;
      target = ".local/share/vim/pack/nix/start/molokai";
    };
    "vim/pack/nix/start/vim-commentary" = {
      source = pkgs.vimPlugins.vim-commentary;
      target = ".local/share/vim/pack/nix/start/vim-commentary";
    };
  };
}
