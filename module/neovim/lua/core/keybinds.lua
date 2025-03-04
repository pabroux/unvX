local keymap = vim.keymap

-- Leader
vim.g.mapleader = " "

-- Normal mode
-- ↳ Clear search highlights
keymap.set("n", "<leader>nh", "<cmd>nohl<cr>", { desc = "Clear search highlights" })
-- ↳ Increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" })
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" })
-- ↳ Navigation
keymap.set("n", "<C-$>", "<C-]>", { desc = "Navigate forward" })
-- ↳ Tab management
keymap.set("n", "<leader>t", "<cmd>tabnew<cr>", { desc = "Open new tab" })
keymap.set("n", "<leader>W", "<cmd>tabclose<cr>", { desc = "Close current tab" })
keymap.set("n", "<leader>é", "<cmd>tabn<cr>", { desc = "Next tab" })
keymap.set("n", "<leader>&", "<cmd>tabp<cr>", { desc = "Prev tab" })
keymap.set("n", "<leader>T", "<cmd>tabnew %<cr>", { desc = "Open current buffer in new tab" })
-- ↳ Window management
keymap.set("n", "<leader>d", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>D", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<C-=>", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "<leader>w", "<cmd>close<cr>", { desc = "Close current split" })
