local keymap = vim.keymap

-- Leader
vim.g.mapleader = " "

-- Normal mode
-- ↳ Clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights." })
-- ↳ Increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number." })
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number." })
-- ↳ Window management
keymap.set("n", "<leader>d", "<C-w>v", { desc = "Split window vertically." })
keymap.set("n", "<leader>D", "<C-w>s", { desc = "Split window horizontally." })
keymap.set("n", "<leader>=", "<C-w>=", { desc = "Make splits equal size." })
keymap.set("n", "<leader>w", "<cmd>close<CR>", { desc = "Close current split." })
-- ↳ Tab management
keymap.set("n", "<leader>t", "<cmd>tabnew<CR>", { desc = "Open new tab." })
keymap.set("n", "<leader>W", "<cmd>tabclose<CR>", { desc = "Close current tab." })
keymap.set("n", "<leader>l", "<cmd>tabn<CR>", { desc = "Go to next tab." })
keymap.set("n", "<leader>h", "<cmd>tabp<CR>", { desc = "Go to previous tab." })
keymap.set("n", "<leader>T", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab." })
