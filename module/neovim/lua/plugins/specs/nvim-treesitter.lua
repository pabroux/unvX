return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	dependencies = {
		"windwp/nvim-ts-autotag",
	},
	config = function()
		local treesitter = require("nvim-treesitter.configs")

		-------------------------------------------------------------------------------
		-- Key bindings
		-------------------------------------------------------------------------------

		local keymaps = {
			init_selection = "<C-space>",
			node_incremental = "<C-space>",
			scope_incremental = false,
			node_decremental = "<bs>",
		}

		-------------------------------------------------------------------------------
		-- Options
		-------------------------------------------------------------------------------

		treesitter.setup({
			highlight = {
				enable = true,
			},
			-- enable indentation
			indent = { enable = true },
			-- enable autotagging with nvim-ts-autotag plugin
			autotag = {
				enable = true,
			},
			-- ensure these language parsers are installed
			ensure_installed = {
				"angular",
				"bash",
				"c",
				"cmake",
				"comment",
				"css",
				"dart",
				"diff",
				"dockerfile",
				"git_config",
				"git_rebase",
				"gitattributes",
				"gitcommit",
				"gitignore",
				"go",
				"graphql",
				"html",
				"javascript",
				"json",
				"lua",
				"make",
				"markdown",
				"nix",
				"php",
				"query",
				"ruby",
				"scss",
				"sql",
				"svelte",
				"terraform",
				"tmux",
				"toml",
				"tsx",
				"typescript",
				"vim",
				"vimdoc",
				"vue",
				"xml",
				"yaml",
			},
			incremental_selection = {
				enable = true,
				keymaps = keymaps,
			},
		})
	end,
}
