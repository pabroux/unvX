return {
	"nvim-tree/nvim-tree.lua",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		local keymap = vim.keymap
		local nvimtree = require("nvim-tree")

		-------------------------------------------------------------------------------
		-- Key bindings
		-------------------------------------------------------------------------------

		keymap.set("n", "<leader>e<leader>", "<cmd>NvimTreeToggle<cr>", { desc = "Toggle file explorer" })
		keymap.set("n", "<leader>ef", "<cmd>NvimTreeFocus<cr>", { desc = "Focus file explorer" })
		keymap.set("n", "<leader>e.", "<cmd>NvimTreeFindFile<cr>", { desc = "Toggle file explorer on current file" })

		local function on_attach(bufnr)
			local api = require("nvim-tree.api")

			local function opts(desc)
				return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
			end

			api.config.mappings.default_on_attach(bufnr)

			-- Remove defaults
			keymap.del("n", "<c-]>", { buffer = bufnr })
			keymap.del("n", "g?", { buffer = bufnr })
			keymap.del("n", "<2-LeftMouse>", { buffer = bufnr })
			keymap.del("n", "<2-RightMouse>", { buffer = bufnr })

			-- Override defaults
			keymap.set("n", "<c-$>", api.tree.change_root_to_node, opts("CD"))
			keymap.set("n", "?", api.tree.toggle_help, opts("Help"))
		end

		-------------------------------------------------------------------------------
		-- Options
		-------------------------------------------------------------------------------

		nvimtree.setup({
			view = {
				width = 35,
				relativenumber = true,
			},
			renderer = {
				indent_markers = {
					enable = true,
				},
				icons = {
					symlink_arrow = "  ",
				},
			},
			-- Disable window_picker for explorer to work well with window splits
			actions = {
				open_file = {
					window_picker = {
						enable = false,
					},
				},
			},
			filters = {
				custom = { ".DS_Store" },
			},
			git = {
				ignore = false,
			},
			on_attach = on_attach,
			sync_root_with_cwd = true,
		})

		-- Recommended settings from nvim-tree documentation
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1
	end,
}
