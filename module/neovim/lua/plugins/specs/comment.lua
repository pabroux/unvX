return {
	"numToStr/Comment.nvim",
	dependencies = {
		"JoosepAlviste/nvim-ts-context-commentstring",
	},
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local comment = require("Comment")
		local ts_context_commentstring = require("ts_context_commentstring.integrations.comment_nvim")

		-------------------------------------------------------------------------------
		-- Options
		-------------------------------------------------------------------------------

		comment.setup({
			-- Required for commenting tsx, jsx, svelte and html files
			pre_hook = ts_context_commentstring.create_pre_hook(),
		})
	end,
}
