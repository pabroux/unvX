-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua

local api = vim.api
local opt = vim.opt

-- Appearance
opt.background = "dark"

-- Backspace
opt.backspace = "indent,eol,start"

-- Cursor
opt.guicursor = ""

-- Indentation
opt.autoindent = true

-- Netrw
api.nvim_set_var("netrw_liststyle", 3)

-- Search
opt.incsearch = true
opt.hlsearch = true
