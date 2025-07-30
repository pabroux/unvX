return {
	"gbprod/substitute.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local keymap = vim.keymap
		local substitute = require("substitute")

		-------------------------------------------------------------------------------
		-- Key bindings
		-------------------------------------------------------------------------------

		keymap.set("n", "§", substitute.operator, { desc = "Substitute with motion" })
		keymap.set("n", "§§", substitute.line, { desc = "Substitute line" })
		keymap.set("n", "6", substitute.eol, { desc = "Substitute to end of line" })
		keymap.set("x", "§", substitute.visual, { desc = "Substitute in visual mode" })

		-------------------------------------------------------------------------------
		-- Options
		-------------------------------------------------------------------------------

		substitute.setup()
	end,
}
