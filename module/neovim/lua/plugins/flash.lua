return {
	"folke/flash.nvim",
	event = "VeryLazy",
	keys = {
		-------------------------------------------------------------------------------
		--- Key Bindings
		-------------------------------------------------------------------------------

		{
			mode = { "n", "x", "o" },
			"s",
			function()
				require("flash").jump()
			end,
			desc = "Flash",
		},
		{
			mode = { "n", "x", "o" },
			"S",
			function()
				require("flash").treesitter()
			end,
			desc = "Flash Treesitter",
		},
		{
			mode = "o",
			"r",
			function()
				require("flash").remote()
			end,
			desc = "Remote Flash",
		},
		{
			mode = { "o", "x" },
			"R",
			function()
				require("flash").treesitter_search()
			end,
			desc = "Treesitter search",
		},
		{
			mode = { "c" },
			"<c-s>",
			function()
				require("flash").toggle()
			end,
			desc = "Toggle Flash search",
		},
	},
	opts = {
		-------------------------------------------------------------------------------
		-- Options
		-------------------------------------------------------------------------------

		modes = {
			search = {
				enabled = true,
			},
			char = {
				jump_labels = true,
			},
		},
	},
}
