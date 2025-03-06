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
			accept_word = "<c-ù>",
			accept_line = "<c-$>",
			clear = "<c-bs>",
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
