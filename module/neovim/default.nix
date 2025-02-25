{
  config,
  pkgs,
  lib,
  unvX,
  ...
}: {
  home.packages = [
    pkgs.neovim
  ];

  home.file = {
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
    "neovim/lua/core/options.lua" = {
      source = config.lib.file.mkOutOfStoreSymlink "${unvX.directory.module}/neovim/lua/core/options.lua";
      target = ".config/nvim/lua/core/options.lua";
    };
    "neovim/lua/plugins/init.lua" = {
      source = config.lib.file.mkOutOfStoreSymlink "${unvX.directory.module}/neovim/lua/plugins/init.lua";
      target = ".config/nvim/lua/plugins/init.lua";
    };
    "neovim/lua/plugins/lazy.lua" = {
      source = config.lib.file.mkOutOfStoreSymlink "${unvX.directory.module}/neovim/lua/plugins/lazy.lua";
      target = ".config/nvim/lua/plugins/lazy.lua";
    };
    "neovim/lua/plugins/specs/alpha-nvim.lua" = {
      source = config.lib.file.mkOutOfStoreSymlink "${unvX.directory.module}/neovim/lua/plugins/specs/alpha-nvim.lua";
      target = ".config/nvim/lua/plugins/specs/alpha-nvim.lua";
    };
    "neovim/lua/plugins/specs/auto-session.lua" = {
      source = config.lib.file.mkOutOfStoreSymlink "${unvX.directory.module}/neovim/lua/plugins/specs/auto-session.lua";
      target = ".config/nvim/lua/plugins/specs/auto-session.lua";
    };
    "neovim/lua/plugins/specs/bufferline.lua" = {
      source = config.lib.file.mkOutOfStoreSymlink "${unvX.directory.module}/neovim/lua/plugins/specs/bufferline.lua";
      target = ".config/nvim/lua/plugins/specs/bufferline.lua";
    };
    "neovim/lua/plugins/specs/lualine.lua" = {
      source = config.lib.file.mkOutOfStoreSymlink "${unvX.directory.module}/neovim/lua/plugins/specs/lualine.lua";
      target = ".config/nvim/lua/plugins/specs/lualine.lua";
    };
    "neovim/lua/plugins/specs/nvim-treesitter.lua" = {
      source = config.lib.file.mkOutOfStoreSymlink "${unvX.directory.module}/neovim/lua/plugins/specs/nvim-treesitter.lua";
      target = ".config/nvim/lua/plugins/specs/nvim-treesitter.lua";
    };
    "neovim/lua/plugins/specs/nvim-tree.lua" = {
      source = config.lib.file.mkOutOfStoreSymlink "${unvX.directory.module}/neovim/lua/plugins/specs/nvim-tree.lua";
      target = ".config/nvim/lua/plugins/specs/nvim-tree.lua";
    };
    "neovim/lua/plugins/specs/smart-splits.lua" = {
      source = config.lib.file.mkOutOfStoreSymlink "${unvX.directory.module}/neovim/lua/plugins/specs/smart-splits.lua";
      target = ".config/nvim/lua/plugins/specs/smart-splits.lua";
    };
    "neovim/lua/plugins/specs/snacks.lua" = {
      source = config.lib.file.mkOutOfStoreSymlink "${unvX.directory.module}/neovim/lua/plugins/specs/snacks.lua";
      target = ".config/nvim/lua/plugins/specs/snacks.lua";
    };
    "neovim/lua/plugins/specs/telescope.lua" = {
      source = config.lib.file.mkOutOfStoreSymlink "${unvX.directory.module}/neovim/lua/plugins/specs/telescope.lua";
      target = ".config/nvim/lua/plugins/specs/telescope.lua";
    };
    "neovim/lua/plugins/specs/tokyonight.lua" = {
      source = config.lib.file.mkOutOfStoreSymlink "${unvX.directory.module}/neovim/lua/plugins/specs/tokyonight.lua";
      target = ".config/nvim/lua/plugins/specs/tokyonight.lua";
    };
    "neovim/lua/plugins/specs/which-key.lua" = {
      source = config.lib.file.mkOutOfStoreSymlink "${unvX.directory.module}/neovim/lua/plugins/specs/which-key.lua";
      target = ".config/nvim/lua/plugins/specs/which-key.lua";
    };
    "neovim/lua/plugins/specs/zen-mode.lua" = {
      source = config.lib.file.mkOutOfStoreSymlink "${unvX.directory.module}/neovim/lua/plugins/specs/zen-mode.lua";
      target = ".config/nvim/lua/plugins/specs/zen-mode.lua";
    };
  };

  home.activation = {
    installNeovimPlugins =
      lib.hm.dag.entryAfter ["installPackages"]
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
