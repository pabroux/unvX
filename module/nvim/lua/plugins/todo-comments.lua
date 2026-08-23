return {
	"folke/todo-comments.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local keymap = vim.keymap
		local todo_comments = require("todo-comments")

		-------------------------------------------------------------------------------
		-- Key bindings
		-------------------------------------------------------------------------------

		keymap.set("n", "]t", function()
			todo_comments.jump_next()
		end, { desc = "Next todo comment" })

		keymap.set("n", "[t", function()
			todo_comments.jump_prev()
		end, { desc = "Previous todo comment" })

		-------------------------------------------------------------------------------
		-- Options
		-------------------------------------------------------------------------------

		todo_comments.setup()
	end,
}
