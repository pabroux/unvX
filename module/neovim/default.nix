{
  config,
  pkgs,
  lib,
  unvX,
  ...
}: let
  plugins = [
    "alpha-nvim"
    "auto-session"
    "bufferline"
    "codeium"
    "comment"
    "conform"
    "gitsigns"
    "indent-blankline"
    "lazygit"
    "lualine"
    "mason"
    "nvim-autopairs"
    "nvim-cmp"
    "nvim-lint"
    "nvim-lspconfig"
    "nvim-surround"
    "nvim-tree"
    "nvim-treesitter"
    "smart-splits"
    "snacks"
    "substitute"
    "telescope"
    "todo-comments"
    "toggleterm"
    "tokyonight"
    "trouble"
    "which-key"
  ];
in {
  home.packages = [
    pkgs.neovim
  ];

  home.file =
    {
      "neovim/init.lua" = {
        source = config.lib.file.mkOutOfStoreSymlink "${unvX.directory.module}/neovim/init.lua";
        target = ".config/nvim/init.lua";
      };
      "neovim/lua/core/init.lua" = {
        source = config.lib.file.mkOutOfStoreSymlink "${unvX.directory.module}/neovim/lua/core/init.lua";
        target = ".config/nvim/lua/core/init.lua";
      };
      "neovim/lua/core/keybinds.lua" = {
        source = config.lib.file.mkOutOfStoreSymlink "${unvX.directory.module}/neovim/lua/core/keybinds.lua";
        target = ".config/nvim/lua/core/keybinds.lua";
      };
      "neovim/lua/core/lazy.lua" = {
        source = config.lib.file.mkOutOfStoreSymlink "${unvX.directory.module}/neovim/lua/core/lazy.lua";
        target = ".config/nvim/lua/core/lazy.lua";
      };
      "neovim/lua/core/options.lua" = {
        source = config.lib.file.mkOutOfStoreSymlink "${unvX.directory.module}/neovim/lua/core/options.lua";
        target = ".config/nvim/lua/core/options.lua";
      };
    }
    // builtins.listToAttrs (map (plugin: {
        name = "neovim/lua/plugins/${plugin}.lua";
        value =
          (plugin: {
            source = config.lib.file.mkOutOfStoreSymlink "${unvX.directory.module}/neovim/lua/plugins/${plugin}.lua";
            target = ".config/nvim/lua/plugins/${plugin}.lua";
          })
          plugin;
      })
      plugins);

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
