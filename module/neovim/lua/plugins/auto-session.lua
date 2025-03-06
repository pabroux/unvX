return {
	"rmagatti/auto-session",
	keys = {
		-------------------------------------------------------------------------------
		-- Key bindings
		-------------------------------------------------------------------------------

		{ mode = { "n" }, "<leader>sl", "<cmd>SessionSearch<cr>", desc = "List sessions" },
		{ mode = { "n" }, "<leader>sr", "<cmd>SessionRestore<cr>", desc = "Restore session for cwd" },
		{ mode = { "n" }, "<leader>ss", "<cmd>SessionSave<cr>", desc = "Save session for auto session root dir" },
	},
	opts = {
		-------------------------------------------------------------------------------
		-- Options
		-------------------------------------------------------------------------------

		auto_restore = false,
		suppressed_dirs = { "~/", "~/Downloads", "~/Documents", "~/Desktop/", "/" },
	},
}
