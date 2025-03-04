return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
		local mason_tool_installer = require("mason-tool-installer")

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
				"angularls",
				"ansiblels",
				"bashls",
				"clangd",
				"cssls",
				"dockerls",
				"graphql",
				"harper_ls",
				"intelephense",
				"jsonls",
				"ltex",
				"sqlls",
				"svelte",
				"tailwindcss",
				"terraformls",
				"vimls",
				"volar",
				"yamlls",
			},
		})
		mason_tool_installer.setup({
			ensure_installed = {
				-- Formaters
				"black",
				"isort",
				"prettier",
				"stylua",
				-- Linters
				"eslint_d",
				"pylint",
			},
		})
	end,
}
