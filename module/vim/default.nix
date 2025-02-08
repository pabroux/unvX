{
  config,
  pkgs,
  lib,
  unvX,
  ...
}: {
  home.packages = [
    (
      pkgs.vimPlugins.Vundle-vim.overrideAttrs (oldAttrs: {
          installPhase = "
	  			runHook preInstall
					mkdir -p $out/share/vim-plugins/Vundle.vim
      		mv autoload doc ftplugin syntax test $out/share/vim-plugins/Vundle.vim
					runHook postInstall
    		";
        })
    )
  ];

  home.file = {
    "vim/vimrc" = {
      source = config.lib.file.mkOutOfStoreSymlink "${unvX.directory.module}/vim/vimrc";
      target = ".config/vim/vimrc";
    };
  };

  home.activation = {
    installVimPlugins =
      lib.hm.dag.entryAfter ["installPackages"]
      "(
				PATH=/usr/bin/:$PATH
				if [[ -v DRY_RUN ]]; then
					echo 'echo | echo | vim +PluginInstall +qall &> /dev/null'
			 	elif [[ -v VERBOSE ]]; then
					vim +PluginInstall +qall
				else
					echo | echo | vim +PluginInstall +qall &> /dev/null
				fi
			 )";
  };
}
