return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		local keymap = vim.keymap
		local toggleterm = require("toggleterm")

		-------------------------------------------------------------------------------
		-- Key bindings
		-------------------------------------------------------------------------------

		keymap.set("n", "<leader>;<leader>", "<cmd>ToggleTerm<cr>", { desc = "Toggle terminal" })
		keymap.set("n", "<leader>;f", "<cmd>TermSelect<cr>1<cr><cr>", { desc = "Focus terminal" })

		-------------------------------------------------------------------------------
		-- Options
		-------------------------------------------------------------------------------
		toggleterm.setup({})
	end,
}
