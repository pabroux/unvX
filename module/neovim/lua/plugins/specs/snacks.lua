return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	keys = {
		-------------------------------------------------------------------------------
		-- Key bindings
		-------------------------------------------------------------------------------

		{
			"<leader>ns",
			function()
				Snacks.notifier.show_history()
			end,
			desc = "Notification History",
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
