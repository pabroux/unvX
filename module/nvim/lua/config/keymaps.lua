-- Keymaps are automatically loaded on the VeryLazy event, after the LazyVim defaults
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

local keymap = vim.keymap

-- Drop the LazyVim defaults colliding with the bindings below
local function unmap(mode, lhs)
	pcall(keymap.del, mode, lhs)
end

-- ↳ Profiler and zoom, which make <leader>d and <leader>w wait out `timeoutlen`
unmap("n", "<leader>dpp")
unmap("n", "<leader>dph")
unmap("n", "<leader>wm")

-- ↳ Window management (replaced by <leader>d/<leader>D/<leader>w)
unmap("n", "<leader>-")
unmap("n", "<leader>|")
unmap("n", "<leader>wd") -- otherwise <leader>w waits out `timeoutlen`

-- ↳ Window navigation (replaced by the smart-splits resize bindings)
unmap("n", "<c-h>")
unmap("n", "<c-j>")
unmap("n", "<c-k>")
unmap("n", "<c-l>")

-- Normal mode
-- ↳ Increment/decrement numbers
keymap.set("n", "<leader>+", "<c-a>", { desc = "Increment number" })
keymap.set("n", "<leader>-", "<c-x>", { desc = "Decrement number" })
-- ↳ Navigation
keymap.set("n", "<c-$>", "<c-]>", { desc = "Navigate forward" })
-- ↳ Tab management
keymap.set("n", "<leader>t", "<cmd>tabnew<cr>", { desc = "Open new tab" })
keymap.set("n", "<leader>W", "<cmd>tabclose<cr>", { desc = "Close current tab" })
keymap.set("n", "<leader>é", "<cmd>tabn<cr>", { desc = "Next tab" })
keymap.set("n", "<leader>&", "<cmd>tabp<cr>", { desc = "Prev tab" })
keymap.set("n", "<leader>T", "<cmd>tabnew %<cr>", { desc = "Open current buffer in new tab" })
-- ↳ Window management
keymap.set("n", "<leader>d", "<c-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>D", "<c-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<c-=>", "<c-w>=", { desc = "Make splits equal size" })
keymap.set("n", "<leader>w", "<cmd>close<cr>", { desc = "Close current split" })
-- ↳ Zoom and center the current pane
Snacks.toggle.zoom():map("<leader><cr>")
Snacks.toggle.zen():map("<leader>Z")
-- ↳ Pane resizing (smart-splits, accepts a range)
keymap.set("n", "<c-h>", "<cmd>SmartResizeLeft<cr>", { desc = "Resize pane left" })
keymap.set("n", "<c-j>", "<cmd>SmartResizeDown<cr>", { desc = "Resize pane down" })
keymap.set("n", "<c-k>", "<cmd>SmartResizeUp<cr>", { desc = "Resize pane up" })
keymap.set("n", "<c-l>", "<cmd>SmartResizeRight<cr>", { desc = "Resize pane right" })
-- ↳ Pane focus (smart-splits, alt+hjkl on macOS, accepts a range)
keymap.set("n", "Ì", "<cmd>SmartCursorMoveLeft<cr>", { desc = "Focus pane left" })
keymap.set("n", "Ï", "<cmd>SmartCursorMoveDown<cr>", { desc = "Focus pane down" })
keymap.set("n", "È", "<cmd>SmartCursorMoveUp<cr>", { desc = "Focus pane up" })
keymap.set("n", "¬", "<cmd>SmartCursorMoveRight<cr>", { desc = "Focus pane right" })

-- Terminal mode
keymap.set("t", "<c-d>", [[<c-\><c-n>]], { desc = "Escape terminal mode" })
