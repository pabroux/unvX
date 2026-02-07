return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
	},
	config = function()
		local cmp_nvim_lsp = require("cmp_nvim_lsp")
		local keymap = vim.keymap

		-------------------------------------------------------------------------------
		-- Key bindings
		-------------------------------------------------------------------------------

		local callback = function(ev)
			-- Buffer local mappings.
			-- See `:help vim.lsp.*` for documentation on any of the below functions
			local opts = { buffer = ev.buf, silent = true }

			opts.desc = "Previous diagnostic"
			keymap.set("n", "[x", vim.diagnostic.goto_prev, opts)
			opts.desc = "Next diagnostic"
			keymap.set("n", "]x", vim.diagnostic.goto_next, opts)

			opts.desc = "Find LSP definitions"
			keymap.set("n", "<leader>fld", "<cmd>Telescope lsp_definitions<cr>", opts)
			opts.desc = "Find LSP implementations"
			keymap.set("n", "<leader>fli", "<cmd>Telescope lsp_implementations<cr>", opts)
			opts.desc = "Find LSP references"
			keymap.set("n", "<leader>flr", "<cmd>Telescope lsp_references<cr>", opts)
			opts.desc = "Find LSP type definitions"
			keymap.set("n", "<leader>flt", "<cmd>Telescope lsp_type_definitions<cr>", opts)
			opts.desc = "Find file diagnostics"
			keymap.set("n", "<leader>fxf", "<cmd>Telescope diagnostics bufnr=0<cr>", opts)
			opts.desc = "Find workspace diagnostics"
			keymap.set("n", "<leader>fxw", "<cmd>Telescope diagnostics<cr>", opts)

			opts.desc = "Jump to declaration"
			keymap.set("n", "<leader>lD", vim.lsp.buf.declaration, opts)
			opts.desc = "Show documentation under cursor"
			keymap.set("n", "<leader>lK", vim.lsp.buf.hover, opts)
			opts.desc = "List available code actions"
			keymap.set({ "n", "v" }, "<leader>ll", vim.lsp.buf.code_action, opts)
			opts.desc = "Smart rename"
			keymap.set("n", "<leader>lrn", vim.lsp.buf.rename, opts)
			opts.desc = "Restart LSP"
			keymap.set("n", "<leader>lrt", ":LspRestart<cr>", opts)
			opts.desc = "Show line diagnostics"
			keymap.set("n", "<leader>lx", vim.diagnostic.open_float, opts)
		end

		function toggle_diagnostics()
			vim.diagnostic.enable(not vim.diagnostic.is_enabled())
		end

		keymap.del("n", "[d")
		keymap.del("n", "]d")

		keymap.set(
			"n",
			"<leader>x<leader>",
			toggle_diagnostics,
			{ noremap = true, silent = true, desc = "Toggle diagnostics" }
		)

		-------------------------------------------------------------------------------
		-- Options
		-------------------------------------------------------------------------------

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = callback,
		})

		-- Used to enable auto-completion (assign to every lsp server config)
		local capabilities = cmp_nvim_lsp.default_capabilities()

		vim.lsp.config("*", {
			capabilities = capabilities,
		})

		-- Change the Diagnostic symbols in the sign column (gutter)
		local severity = vim.diagnostic.severity

		vim.diagnostic.config({
			signs = {
				text = {
					[severity.ERROR] = " ",
					[severity.WARN] = " ",
					[severity.HINT] = " ",
					[severity.INFO] = " ",
				},
			},
		})
	end,
}
