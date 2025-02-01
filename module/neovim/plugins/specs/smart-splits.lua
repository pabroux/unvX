return {
	"mrjones2014/smart-splits.nvim",
	config = function()
		-- Key bindings
		-- ↳ Resize pane (the following keymaps accept a range)
		vim.keymap.set("n", "<C-h>", require("smart-splits").resize_left)
		vim.keymap.set("n", "<C-j>", require("smart-splits").resize_down)
		vim.keymap.set("n", "<C-k>", require("smart-splits").resize_up)
		vim.keymap.set("n", "<C-l>", require("smart-splits").resize_right)
		-- ↳ Focus pane
		vim.keymap.set("n", "Ì", require("smart-splits").move_cursor_left)
		vim.keymap.set("n", "Ï", require("smart-splits").move_cursor_down)
		vim.keymap.set("n", "È", require("smart-splits").move_cursor_up)
		vim.keymap.set("n", "¬", require("smart-splits").move_cursor_right)

		-- Options
		require("smart-splits").setup({
			at_edge = "stop",
		})
	end,
}
