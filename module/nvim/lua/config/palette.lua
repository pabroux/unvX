-- Single source for every hex value. Consumers read it from here directly.
-- Keys are named after the core vim highlight group the value lands on
-- (`:h highlight-groups`), not after any plugin's palette.

return {
	-- Color
	blue = "#4bc3cc",
	green = "#07ffd6",
	violet = "#cc7fff",
	yellow = "#ffd542",
	red = "#fe605a",
	orange = "#fa902d",

	-- Surface
	float_bg = "#000f1c", -- floats, popups, sidebars, borders
	normal_bg = "#011628", -- editor
	statusline_bg = "#112638", -- shows through wherever lualine leaves a cell
	cursorline_bg = "#143652",
	statusline_nc_bg = "#2c3043", -- non-current window
	visual_bg = "#275378",
	search_bg = "#0a64ac",

	-- Text
	normal_fg = "#cbe0f0",
	statusline_fg = "#c3ccdc",
	muted_fg = "#b4d0e9", -- sidebars, secondary labels
	statusline_nc_fg = "#7d8593", -- non-current window
	gutter_fg = "#627e97", -- line numbers
}
