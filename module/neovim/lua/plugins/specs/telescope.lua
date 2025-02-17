return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local transform_mod = require("telescope.actions.mt").transform_mod
		local keymap = vim.keymap

		-------------------------------------------------------------------------------
		-- Key Bindings
		-------------------------------------------------------------------------------

		keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
		keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
		keymap.set("n", "<leader>fl", "<cmd>Telescope quickfix<cr>", { desc = "List items in the quickfix list" })
		keymap.set(
			"n",
			"<leader>fh",
			"<cmd>Telescope quickfixhistory<cr>",
			{ desc = "List all quickfix lists in your history" }
		)
		keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
		keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })

		-------------------------------------------------------------------------------
		-- Options
		-------------------------------------------------------------------------------

		local custom_actions = transform_mod({
			open_quickfix = function(prompt_bufnr)
				require("telescope.builtin").quickfix()
			end,
		})

		telescope.setup({
			defaults = {
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous,
						["<C-j>"] = actions.move_selection_next,
						["<C-q>"] = actions.smart_send_to_qflist + custom_actions.open_quickfix,
					},
				},
			},
			pickers = {
				find_files = {
					follow = true,
					hidden = true,
				},
				grep_string = {
					additional_args = { "-L" },
				},
				live_grep = {
					additional_args = { "-L" },
				},
				quickfix = {
					show_line = false,
				},
			},
		})

		-- Load fzf
		telescope.load_extension("fzf")
	end,
}
