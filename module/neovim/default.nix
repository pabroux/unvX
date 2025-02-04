{
  config,
  pkgs,
  lib,
  ...
}: {
  home.packages = [
    pkgs.neovim
  ];

  home.file = {
    "neovim/init.lua" = {
      source = config.lib.file.mkOutOfStoreSymlink ./init.lua;
      target = ".config/nvim/init.lua";
    };
    "neovim/lua/" = {
      source = ./lua;
      target = ".config/nvim/lua/";
      recursive = true;
    };
  };

  home.activation = {
    installNeovimPlugins =
      lib.hm.dag.entryAfter ["installPackages"]
      "(
      	PATH=$HOME/.nix-profile/bin/:$PATH
				if [[ -v DRY_RUN ]]; then
					echo \"nvim --headless '+Lazy! sync' +qa &> /dev/null\"
					echo \"nvim --headless '+Lazy! install' +qa &> /dev/null\"
				elif [[ -v VERBOSE ]]; then
					nvim --headless '+Lazy! sync' +qa
					nvim --headless '+Lazy! install' +qa
				else
      		nvim --headless '+Lazy! sync' +qa &> /dev/null
					nvim --headless '+Lazy! install' +qa &> /dev/null
				fi
       )";
  };
}
