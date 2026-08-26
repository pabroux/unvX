-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua

local api = vim.api

-- Keep the terminal cursor readable against the colorscheme background
local function set_term_cursor()
	local normal = api.nvim_get_hl(0, { name = "Normal" })
	api.nvim_set_hl(0, "TermCursor", { fg = normal.bg, bg = "#ffffff" })
end

api.nvim_create_autocmd("ColorScheme", {
	group = api.nvim_create_augroup("unvx_term_cursor", { clear = true }),
	callback = set_term_cursor,
})

set_term_cursor()
