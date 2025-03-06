return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons", "folke/todo-comments.nvim" },
	cmd = "Trouble",
	keys = {
		-------------------------------------------------------------------------------
		-- Key bindings
		-------------------------------------------------------------------------------

		{ "<leader>xw<leader>", "<cmd>Trouble diagnostics toggle<cr>", desc = "Toggle trouble workspace diagnostics" },
		{ "<leader>xwf", "<cmd>Trouble diagnostics focus<cr>", desc = "Focus trouble workspace diagnostics" },
		{
			"<leader>xf<leader>",
			"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
			desc = "Toggle trouble file diagnostics",
		},
		{ "<leader>xff", "<cmd>Trouble diagnostics focus filter.buf=0<cr>", desc = "Focus trouble file diagnostics" },
		{ "<leader>xq<leader>", "<cmd>Trouble quickfix toggle<cr>", desc = "Toggle trouble quickfix list" },
		{ "<leader>xqf", "<cmd>Trouble quickfix focus<cr>", desc = "Focus trouble quickfix list" },
		{ "<leader>xl<leader>", "<cmd>Trouble loclist toggle<cr>", desc = "Toggle trouble location list" },
		{ "<leader>xlf", "<cmd>Trouble loclist focus<cr>", desc = "Focus trouble location list" },
		{ "<leader>xt<leader>", "<cmd>Trouble todo toggle<cr>", desc = "Toggle todos in trouble" },
		{ "<leader>xtf", "<cmd>Trouble todo focus<cr>", desc = "Focus todos in trouble" },
	},
	opts = {
		-------------------------------------------------------------------------------
		-- Options
		-------------------------------------------------------------------------------

		focus = true,
	},
}
