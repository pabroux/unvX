return {
	"goolord/alpha-nvim",
	event = "VimEnter",
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		-------------------------------------------------------------------------------
		--- Key Bindings
		-------------------------------------------------------------------------------

		-- Set menu
		dashboard.section.buttons.val = {
			dashboard.button("e", "  > New File", "<cmd>ene<cr>"),
			dashboard.button("SPC ee", "  > Toggle file explorer", "<cmd>NvimTreeToggle<cr>"),
			dashboard.button("SPC ff", "󰱼  > Find File", "<cmd>Telescope find_files<cr>"),
			dashboard.button("SPC fs", "  > Find Word", "<cmd>Telescope live_grep<cr>"),
			dashboard.button("SPC sr", "󰁯  > Restore Session For Current Directory", "<cmd>SessionRestore<cr>"),
			dashboard.button("SPC sl", "󱎸  > Search Session", "<cmd>SessionSearch<cr>"),
			dashboard.button("q", "  > Quit NVIM", "<cmd>qa<cr>"),
		}

		-------------------------------------------------------------------------------
		-- Options
		-------------------------------------------------------------------------------

		-- Set header
		dashboard.section.header.val = {
			"                                                     ",
			"  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
			"  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
			"  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
			"  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
			"  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
			"  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
			"                                                     ",
		}

		-- Send config to alpha
		alpha.setup(dashboard.opts)

		-- Disable folding on alpha buffer
		vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
	end,
}
