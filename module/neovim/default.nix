{
  config,
  pkgs,
  lib,
  ...
}: {
  home.packages = [
    pkgs.neovim
  ];

  home.file =
    {
      "init.lua" = {
        source = config.lib.file.mkOutOfStoreSymlink ./init.lua;
        target = ".config/nvim/init.lua";
      };
    }
    // lib.genAttrs (builtins.filter
      (file: builtins.readFileType (./. + "/${file}") == "regular")
      (lib.lists.flatten
        (map (dir: (map (file: "${dir}/" + file) (builtins.attrNames (builtins.readDir (./. + "/${dir}")))))
          ["core" "plugins" "plugins/specs"])))
    (file: {
      source = config.lib.file.mkOutOfStoreSymlink ./. + "/${file}";
      target = ".config/nvim/lua/${file}";
    });

  home.activation = {
    installNeovimPlugins =
      lib.hm.dag.entryAfter ["linkGeneration"]
      "(
      	PATH=$HOME/.nix-profile/bin/:$PATH
				if [[ -v DRY_RUN ]]; then
					echo \"nvim --headless '+Lazy! sync' +qa &> /dev/null\"
				elif [[ -v VERBOSE ]]; then
					nvim --headless '+Lazy! sync' +qa
				else
      		nvim --headless '+Lazy! sync' +qa &> /dev/null
				fi
       )";
  };
}
