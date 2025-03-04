return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")
		local keymap = vim.keymap

		-------------------------------------------------------------------------------
		-- Key bindings
		-------------------------------------------------------------------------------

		keymap.set("n", "<leader>mf", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			})
		end, { desc = "Format file" })

		keymap.set("v", "<leader>mf", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			})
		end, { desc = "Format range" })

		-------------------------------------------------------------------------------
		-- Options
		-------------------------------------------------------------------------------

		conform.setup({
			formatters_by_ft = {
				css = { "prettier" },
				graphql = { "prettier" },
				html = { "prettier" },
				javascript = { "prettier" },
				javascriptreact = { "prettier" },
				json = { "prettier" },
				lua = { "stylua" },
				markdown = { "prettier" },
				python = { "isort", "black" },
				typescript = { "prettier" },
				typescriptreact = { "prettier" },
				svelte = { "prettier" },
				yaml = { "prettier" },
			},
		})
	end,
}
