return {
	"mrjones2014/smart-splits.nvim",
	keys = {
		-------------------------------------------------------------------------------
		-- Key bindings
		-------------------------------------------------------------------------------

		-- Resize pane (the following keymaps accept a range)
		{ mode = { "n" }, "<c-h>", "<cmd>SmartResizeLeft<cr>", desc = "resize pane left" },
		{ mode = { "n" }, "<C-j>", "<cmd>SmartResizeDown<cr>", desc = "Resize pane down" },
		{ mode = { "n" }, "<C-k>", "<cmd>SmartResizeUp<cr>", desc = "Resize pane up" },
		{ mode = { "n" }, "<C-l>", "<cmd>SmartResizeRight<cr>", desc = "Resize pane right" },

		-- Focus pane (the following keymaps accept a range)
		{ mode = { "n" }, "Ì", "<cmd>SmartCursorMoveLeft<cr>", desc = "Focus pane left" },
		{ mode = { "n" }, "Ï", "<cmd>SmartCursorMoveDown<cr>", desc = "Focus pane down" },
		{ mode = { "n" }, "È", "<cmd>SmartCursorMoveUp<cr>", desc = "Focus pane up" },
		{ mode = { "n" }, "¬", "<cmd>SmartCursorMoveRight<cr>", desc = "Focus pane right" },
	},
	opts = {
		-------------------------------------------------------------------------------
		-- Options
		-------------------------------------------------------------------------------

		at_edge = "stop",
		multiplexer_integration = false,
	},
}
