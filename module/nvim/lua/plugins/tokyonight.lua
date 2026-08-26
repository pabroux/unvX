-------------------------------------------------------------------------------
-- Options
-------------------------------------------------------------------------------

local palette = require("config.palette")

-- Command mode accent, shared with lualine
local cmdline = palette.yellow

return {
	{
		"folke/tokyonight.nvim",
		opts = {
			style = "night",
			styles = {
				comments = {},
				keywords = { italic = false },
			},
			on_colors = function(colors)
				colors.bg = palette.normal_bg
				colors.bg_dark = palette.float_bg
				colors.bg_float = palette.float_bg
				colors.bg_highlight = palette.cursorline_bg
				colors.bg_popup = palette.float_bg
				colors.bg_search = palette.search_bg
				colors.bg_sidebar = palette.float_bg
				colors.bg_statusline = palette.statusline_bg
				colors.bg_visual = palette.visual_bg
				colors.border = palette.float_bg
				colors.fg = palette.normal_fg
				colors.fg_dark = palette.muted_fg
				colors.fg_float = palette.normal_fg
				colors.fg_gutter = palette.gutter_fg
				colors.fg_sidebar = palette.muted_fg
			end,
			on_highlights = function(highlights, colors)
				-- Noice registers its groups with `default = true`, so these win
				highlights.NoiceCmdlinePopupBorder = { fg = cmdline }
				highlights.NoiceCmdlinePopupBorderCmdline = { fg = cmdline }
				highlights.NoiceCmdlinePopupTitle = { fg = cmdline }
				highlights.NoiceCmdlineIcon = { fg = cmdline }
				highlights.NoiceCmdlineIconCmdline = { fg = cmdline }
				highlights.NoiceCmdlineIconFilter = { fg = cmdline }
				highlights.SnacksDashboardHeader = { fg = colors.blue1 }
			end,
		},
	},
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "tokyonight",
		},
	},
}
