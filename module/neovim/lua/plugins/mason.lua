return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
	},
	build = ":MasonUpdate",
	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")

		-------------------------------------------------------------------------------
		-- Options
		-------------------------------------------------------------------------------

		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lspconfig.setup({
			-- LSP servers
			ensure_installed = {
				"basedpyright",
				"lua_ls",
			},
		})
	end,
}
