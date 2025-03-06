return {
	"windwp/nvim-autopairs",
	dependencies = {
		"hrsh7th/nvim-cmp",
	},
	event = { "InsertEnter" },
	config = function()
		local autopairs = require("nvim-autopairs")
		local cmp = require("cmp")
		local cmp_autopairs = require("nvim-autopairs.completion.cmp")

		-------------------------------------------------------------------------------
		-- Options
		-------------------------------------------------------------------------------

		autopairs.setup({
			check_ts = true, -- Enable treesitter
			ts_config = {
				lua = { "string" }, -- Don't add pairs in lua string treesitter nodes
				javascript = { "template_string" }, -- Don't add pairs in javascript template_string treesitter nodes
				java = false, -- Don't check treesitter on java
			},
		})

		-- Make autopairs and completion work together
		cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
	end,
}
