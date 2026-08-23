return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")

		-------------------------------------------------------------------------------
		-- Options
		-------------------------------------------------------------------------------

		local colors = {
			blue = "#4bc3cc",
			green = "#07ffd6",
			violet = "#cc7fff",
			yellow = "#ffd542",
			red = "#fe605a",
			orange = "#fa902d",
			fg = "#c3ccdc",
			bg = "#112638",
			inactive_bg = "#2c3043",
		}

		local lualine_theme = {
			normal = {
				a = { bg = colors.blue, fg = colors.bg, gui = "bold" },
				b = { bg = colors.bg, fg = colors.fg },
				c = { bg = colors.bg, fg = colors.fg },
			},
			insert = {
				a = { bg = colors.green, fg = colors.bg, gui = "bold" },
				b = { bg = colors.bg, fg = colors.fg },
				c = { bg = colors.bg, fg = colors.fg },
			},
			visual = {
				a = { bg = colors.violet, fg = colors.bg, gui = "bold" },
				b = { bg = colors.bg, fg = colors.fg },
				c = { bg = colors.bg, fg = colors.fg },
			},
			command = {
				a = { bg = colors.yellow, fg = colors.bg, gui = "bold" },
				b = { bg = colors.bg, fg = colors.fg },
				c = { bg = colors.bg, fg = colors.fg },
			},
			replace = {
				a = { bg = colors.red, fg = colors.bg, gui = "bold" },
				b = { bg = colors.bg, fg = colors.fg },
				c = { bg = colors.bg, fg = colors.fg },
			},
			terminal = {
				a = { bg = colors.orange, fg = colors.bg, gui = "bold" },
				b = { bg = colors.bg, fg = colors.fg },
				c = { bg = colors.bg, fg = colors.fg },
			},
			inactive = {
				a = { bg = colors.inactive_bg, fg = colors.semilightgray, gui = "bold" },
				b = { bg = colors.inactive_bg, fg = colors.semilightgray },
				c = { bg = colors.inactive_bg, fg = colors.semilightgray },
			},
		}

		lualine.setup({
			options = {
				theme = lualine_theme,
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
			},
			extensions = {
				"nvim-tree",
			},
			sections = {
				lualine_b = {
					{ "branch", icon = "" },
					{ "diff" },
					{ "diagnostics", symbols = { error = " ", warn = " ", info = " ", hint = " " } },
				},
				lualine_x = { "encoding", "fileformat", "filetype" },
			},
		})
	end,
}
