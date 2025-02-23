return {
	"akinsho/bufferline.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	version = "*",
	config = function()
		local bufferline = require("bufferline")

		-------------------------------------------------------------------------------
		-- Options
		-------------------------------------------------------------------------------

		bufferline.setup({
			options = {
				style_preset = bufferline.style_preset.no_italic,
				mode = "tabs",
			},
		})
	end,
}
