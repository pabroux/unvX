return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		{
			"L3MON4D3/LuaSnip",
			version = "v2.*",
			build = "make install_jsregexp",
		},
		"saadparwaiz1/cmp_luasnip",
		"rafamadriz/friendly-snippets",
		"onsails/lspkind.nvim",
	},
	event = "InsertEnter",
	config = function()
		require("luasnip.loaders.from_vscode").lazy_load()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		local lspkind = require("lspkind")

		-------------------------------------------------------------------------------
		-- Key bindings
		-------------------------------------------------------------------------------

		local keymaps = cmp.mapping.preset.insert({
			["<c-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
			["<c-j>"] = cmp.mapping.select_next_item(), -- next suggestion
			["<c-;>"] = cmp.mapping.scroll_docs(-4),
			["<c-,>"] = cmp.mapping.scroll_docs(4),
			["<c-space>"] = cmp.mapping.complete(), -- show completion suggestions
			["<c-e>"] = cmp.mapping.abort(), -- close completion window
			["<cr>"] = cmp.mapping.confirm({ select = false }),
		})

		-------------------------------------------------------------------------------
		-- Options
		-------------------------------------------------------------------------------

		cmp.setup({
			completion = {
				completeopt = "menu,menuone,preview,noselect",
			},
			snippet = { -- configure how nvim-cmp interacts with snippet engine
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			mapping = keymaps,
			-- sources for autocompletion
			sources = cmp.config.sources({
				{ name = "luasnip" }, -- snippets
				{ name = "buffer" }, -- text within current buffer
				{ name = "path" }, -- file system paths
			}),
			-- configure lspkind for vs-code like pictograms in completion menu
			formatting = {
				format = lspkind.cmp_format({
					maxwidth = 50,
					ellipsis_char = "…",
				}),
			},
		})
	end,
}
