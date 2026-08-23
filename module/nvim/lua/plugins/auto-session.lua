return {
	"rmagatti/auto-session",
	keys = {
		-------------------------------------------------------------------------------
		-- Key bindings
		-------------------------------------------------------------------------------

		{ mode = { "n" }, "<leader>sl", "<cmd>AutoSession search<cr>", desc = "List sessions" },
		{ mode = { "n" }, "<leader>sr", "<cmd>AutoSession restore<cr>", desc = "Restore session for cwd" },
		{ mode = { "n" }, "<leader>ss", "<cmd>AutoSession save<cr>", desc = "Save session for auto session root dir" },
	},
	opts = {
		-------------------------------------------------------------------------------
		-- Options
		-------------------------------------------------------------------------------

		auto_restore = false,
		suppressed_dirs = { "~/", "~/Downloads", "~/Documents", "~/Desktop/", "/" },
	},
}
