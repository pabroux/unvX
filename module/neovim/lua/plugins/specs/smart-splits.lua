return {
	"mrjones2014/smart-splits.nvim",
	config = function()
		local smart_splits = require("smart-splits")
		local keymap = vim.keymap

		-------------------------------------------------------------------------------
		-- Key bindings
		-------------------------------------------------------------------------------

		-- Resize pane (the following keymaps accept a range)
		keymap.set("n", "<C-h>", smart_splits.resize_left, { desc = "Resize pane left" })
		keymap.set("n", "<C-j>", smart_splits.resize_down, { desc = "Resize pane down" })
		keymap.set("n", "<C-k>", smart_splits.resize_up, { desc = "Resize pane up" })
		keymap.set("n", "<C-l>", smart_splits.resize_right, { desc = "Resize pane right" })

		-- Focus pane (the following keymaps accept a range)
		keymap.set("n", "Ì", smart_splits.move_cursor_left, { desc = "Focus pane left" })
		keymap.set("n", "Ï", smart_splits.move_cursor_down, { desc = "Focus pane down" })
		keymap.set("n", "È", smart_splits.move_cursor_up, { desc = "Focus pane up" })
		keymap.set("n", "¬", smart_splits.move_cursor_right, { desc = "Focus pane right" })

		-------------------------------------------------------------------------------
		-- Options
		-------------------------------------------------------------------------------

		smart_splits.setup({
			at_edge = "stop",
			multiplexer_integration = false,
		})
	end,
}
