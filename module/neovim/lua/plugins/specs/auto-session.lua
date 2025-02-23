return {
	"rmagatti/auto-session",
	config = function()
		local auto_session = require("auto-session")
		local keymap = vim.keymap

		-------------------------------------------------------------------------------
		-- Key Bindings
		-------------------------------------------------------------------------------

		keymap.set("n", "<leader>sl", "<cmd>SessionSearch<cr>", { desc = "List sessions" })
		keymap.set("n", "<leader>sr", "<cmd>SessionRestore<cr>", { desc = "Restore session for cwd" })
		keymap.set("n", "<leader>ss", "<cmd>SessionSave<cr>", { desc = "Save session for auto session root dir" })

		-------------------------------------------------------------------------------
		-- Options
		-------------------------------------------------------------------------------

		auto_session.setup({
			auto_restore = false,
			suppressed_dirs = { "~/", "~/Downloads", "~/Documents", "~/Desktop/", "/" },
		})
	end,
}
