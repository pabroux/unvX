return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	keys = {
		-------------------------------------------------------------------------------
		-- Key bindings
		-------------------------------------------------------------------------------

		{
			"<leader>nl",
			function()
				Snacks.notifier.show_history()
			end,
			desc = "List notifications",
		},
	},
	opts = {
		-------------------------------------------------------------------------------
		-- Options
		-------------------------------------------------------------------------------

		input = {
			enabled = true,
		},
		notifier = {
			enabled = true,
		},
	},
}
