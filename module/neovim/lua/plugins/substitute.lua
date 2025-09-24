return {
	"gbprod/substitute.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local keymap = vim.keymap
		local substitute = require("substitute")

		-------------------------------------------------------------------------------
		-- Key bindings
		-------------------------------------------------------------------------------

		keymap.set("n", "<leader>§", substitute.operator, { desc = "Substitute with motion" })
		keymap.set("n", "<leader>§§", substitute.line, { desc = "Substitute line" })
		keymap.set("n", "<leader>6", substitute.eol, { desc = "Substitute to end of line" })
		keymap.set("x", "<leader>§", substitute.visual, { desc = "Substitute hunk" })

		-------------------------------------------------------------------------------
		-- Options
		-------------------------------------------------------------------------------

		substitute.setup()
	end,
}
