return {
	"Exafunction/windsurf.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	build = ":Codeium Auth",
	event = "InsertEnter",
	config = function()
		local windsurf = require("codeium")

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

		windsurf.setup({
			enable_cmp_source = false,
			quiet = true,
			virtual_text = {
				enabled = true,
				filetypes = {
					TelescopePrompt = false,
				},
				key_bindings = keymaps,
			},
		})
	end,
}
