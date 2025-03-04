return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = {
		"windwp/nvim-ts-autotag",
	},
	build = ":TSUpdate",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local treesitter = require("nvim-treesitter.configs")

		-------------------------------------------------------------------------------
		-- Key bindings
		-------------------------------------------------------------------------------

		local keymaps = {
			init_selection = "<c-space>",
			node_incremental = "<c-space>",
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
			-- Enable indentation
			indent = { enable = true },
			-- Enable autotagging with nvim-ts-autotag plugin
			autotag = {
				enable = true,
			},
			-- Ensure these language parsers are installed
			ensure_installed = {
				"angular",
				"bash",
				"c",
				"cmake",
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
