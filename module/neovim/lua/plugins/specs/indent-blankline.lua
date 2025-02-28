return {
	"lukas-reineke/indent-blankline.nvim",
	event = { "BufReadPre", "BufNewFile" },
	main = "ibl",
	opts = {
		-------------------------------------------------------------------------------
		-- Options
		-------------------------------------------------------------------------------

		indent = { char = "┊" },
	},
}
