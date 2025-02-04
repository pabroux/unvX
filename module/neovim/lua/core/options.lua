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
vim.cmd("let g:netrw_liststyle = 3")

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.hlsearch = true

-- Split windows
opt.splitbelow = true
opt.splitright = true
