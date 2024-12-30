{ config, pkgs, lib, ... }:

{
	home.packages = [
		(pkgs.vimPlugins.Vundle-vim.overrideAttrs (oldAttrs: {
    		installPhase = "
	  			mkdir -p $out/share/vim-plugins/bundle/Vundle.vim
      			mv autoload doc ftplugin syntax test $out/share/vim-plugins/bundle/Vundle.vim
    		";
  		}))
	];
	
	home.file = {
		".vimrc" = {
			source = config.lib.file.mkOutOfStoreSymlink ./.vimrc;
		};
	};

	home.activation = {
		installVundlePlugins = lib.hm.dag.entryAfter ["linkGeneration"]
			"(
				PATH=/usr/bin/:$PATH
				echo | echo | vim +PluginInstall +qall &> /dev/null
			 )";
	};
}
