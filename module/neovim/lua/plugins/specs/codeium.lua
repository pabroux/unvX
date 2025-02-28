return {
	"Exafunction/codeium.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	build = ":Codeium Auth",
	event = "InsertEnter",
	config = function()
		local codeium = require("codeium")

		-------------------------------------------------------------------------------
		-- Key bindings
		-------------------------------------------------------------------------------

		local keymaps = {
			accept = "<c-cr>",
			accept_word = false,
			accept_line = false,
			clear = false,
			next = "<c-=>",
			prev = "<c-:>",
		}

		-------------------------------------------------------------------------------
		-- Options
		-------------------------------------------------------------------------------

		codeium.setup({
			enable_cmp_source = false,
			virtual_text = {
				enabled = true,
				key_bindings = keymaps,
			},
		})
	end,
}
