local api = vim.api
local opt = vim.opt

-- Appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- Backspace
opt.backspace = "indent,eol,start"

-- Clipboard
opt.clipboard:append("unnamedplus")

-- Cursor
opt.guicursor = ""

-- Cursor color
api.nvim_set_hl(0, "TermCursor", { fg = vim.api.nvim_get_hl_by_name("Normal", true).background, bg = "#ffffff" })

-- Cursor line
opt.cursorline = true

-- Indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- Line number
opt.number = true
opt.relativenumber = true

-- Line wrapping
opt.wrap = false

-- Netrw
api.nvim_set_var("netrw_liststyle", 3)

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.hlsearch = true

-- Split windows
opt.splitbelow = true
opt.splitright = true

-- Status line
opt.showmode = false
