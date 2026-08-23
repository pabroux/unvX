{
  config,
  pkgs,
  lib,
  unvX,
  ...
}: {
  home.packages = [
    pkgs.neovim
    pkgs.nodejs
  ];

  home.file =
    {
      "nvim/init.lua" = {
        source = config.lib.file.mkOutOfStoreSymlink "${unvX.directory.module}/nvim/init.lua";
        target = ".config/nvim/init.lua";
      };
      "nvim/lua/core/init.lua" = {
        source = config.lib.file.mkOutOfStoreSymlink "${unvX.directory.module}/nvim/lua/core/init.lua";
        target = ".config/nvim/lua/core/init.lua";
      };
      "nvim/lua/core/keybinds.lua" = {
        source = config.lib.file.mkOutOfStoreSymlink "${unvX.directory.module}/nvim/lua/core/keybinds.lua";
        target = ".config/nvim/lua/core/keybinds.lua";
      };
      "nvim/lua/core/lazy.lua" = {
        source = config.lib.file.mkOutOfStoreSymlink "${unvX.directory.module}/nvim/lua/core/lazy.lua";
        target = ".config/nvim/lua/core/lazy.lua";
      };
      "nvim/lua/core/options.lua" = {
        source = config.lib.file.mkOutOfStoreSymlink "${unvX.directory.module}/nvim/lua/core/options.lua";
        target = ".config/nvim/lua/core/options.lua";
      };
    }
    // builtins.listToAttrs (map (plugin: {
        name = "nvim/lua/plugins/${plugin}";
        value =
          (plugin: {
            source = config.lib.file.mkOutOfStoreSymlink "${unvX.directory.module}/nvim/lua/plugins/${plugin}";
            target = ".config/nvim/lua/plugins/${plugin}";
          })
          plugin;
      })
      (builtins.attrNames (builtins.readDir ./lua/plugins)));

  home.activation = {
    installNeovimPlugins =
      lib.hm.dag.entryAfter ["installPackages" "linkGeneration"]
      "(
        PATH=$HOME/.nix-profile/bin:$PATH
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
