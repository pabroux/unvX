return {
	"folke/zen-mode.nvim",
	keys = {
		-------------------------------------------------------------------------------
		-- Key bindings
		-------------------------------------------------------------------------------

		{ mode = { "n" }, "<leader>z", "<cmd>ZenMode<cr>", desc = "Zoom current pane" },
	},
	opts = {
		-------------------------------------------------------------------------------
		-- Options
		-------------------------------------------------------------------------------

		window = {
			backdrop = 1,
			width = 1,
			height = 1,
		},
		plugins = {
			options = {
				enabled = true,
				ruler = false,
				showcmd = false,
				laststatus = 3,
			},
		},
	},
}
