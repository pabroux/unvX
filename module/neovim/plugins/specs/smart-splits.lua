return {
	"mrjones2014/smart-splits.nvim",
	config = function()
		local smart_splits = require("smart-splits")

		-- Key bindings
		-- ↳ Resize pane (the following keymaps accept a range)
		vim.keymap.set("n", "<C-h>", smart_splits.resize_left)
		vim.keymap.set("n", "<C-j>", smart_splits.resize_down)
		vim.keymap.set("n", "<C-k>", smart_splits.resize_up)
		vim.keymap.set("n", "<C-l>", smart_splits.resize_right)
		-- ↳ Focus pane (the following keymaps accept a range)
		vim.keymap.set("n", "Ì", smart_splits.move_cursor_left)
		vim.keymap.set("n", "Ï", smart_splits.move_cursor_down)
		vim.keymap.set("n", "È", smart_splits.move_cursor_up)
		vim.keymap.set("n", "¬", smart_splits.move_cursor_right)

		-- Options
		smart_splits.setup({
			at_edge = "stop",
			multiplexer_integration = false,
		})
	end,
}
