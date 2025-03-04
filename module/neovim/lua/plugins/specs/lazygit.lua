return {
	"kdheepak/lazygit.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	cmd = {
		"LazyGit",
		"LazyGitConfig",
		"LazyGitCurrentFile",
		"LazyGitFilter",
		"LazyGitFilterCurrentFile",
	},
	keys = {
		-------------------------------------------------------------------------------
		-- Key bindings
		-------------------------------------------------------------------------------

		{ "<leader>lg", "<cmd>LazyGit<cr>", desc = "Open lazy git" },
	},
}
