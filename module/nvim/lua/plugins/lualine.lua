return {
	"nvim-lualine/lualine.nvim",
	opts = function(_, opts)
		-------------------------------------------------------------------------------
		-- Options
		-------------------------------------------------------------------------------

		local palette = require("config.palette")

		local function mode(accent)
			return {
				a = { bg = accent, fg = palette.statusline_bg, gui = "bold" },
				b = { bg = palette.statusline_bg, fg = palette.statusline_fg },
				c = { bg = palette.statusline_bg, fg = palette.statusline_fg },
			}
		end

		opts.options = vim.tbl_deep_extend("force", opts.options or {}, {
			theme = {
				normal = mode(palette.blue),
				insert = mode(palette.green),
				visual = mode(palette.violet),
				command = mode(palette.yellow),
				replace = mode(palette.red),
				terminal = mode(palette.orange),
				inactive = {
					a = { bg = palette.statusline_nc_bg, fg = palette.statusline_nc_fg, gui = "bold" },
					b = { bg = palette.statusline_nc_bg, fg = palette.statusline_nc_fg },
					c = { bg = palette.statusline_nc_bg, fg = palette.statusline_nc_fg },
				},
			},
			component_separators = { left = "", right = "" },
			section_separators = { left = "", right = "" },
		})

		return opts
	end,
}
