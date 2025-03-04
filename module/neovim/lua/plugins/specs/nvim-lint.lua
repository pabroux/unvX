return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local keymap = vim.keymap
		local lint = require("lint")

		-------------------------------------------------------------------------------
		-- Key bindings
		-------------------------------------------------------------------------------

		keymap.set("n", "<leader>li", function()
			lint.try_lint()
		end, { desc = "Trigger linting for current file" })

		-------------------------------------------------------------------------------
		-- Options
		-------------------------------------------------------------------------------

		lint.linters_by_ft = {
			javascript = { "eslint_d" },
			javascriptreact = { "eslint_d" },
			python = { "pylint" },
			svelte = { "eslint_d" },
			typescript = { "eslint_d" },
			typescriptreact = { "eslint_d" },
		}

		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				lint.try_lint()
			end,
		})
	end,
}
