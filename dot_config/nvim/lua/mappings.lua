vim.g.mapleader = " "
vim.keymap.set("i", "jk", "<Esc>")

-- miscellaneous
vim.keymap.set({ "n", "v", "o" }, "<leader>l", "$")
vim.keymap.set({ "n", "v", "o" }, "<leader>h", "^")

-- Resize split windows using arrow keys by pressing:
-- CTRL+UP, CTRL+DOWN, CTRL+LEFT, or CTRL+RIGHT.
vim.keymap.set("n", "<C-Up>", "<C-w>+")
vim.keymap.set("n", "<C-Down>", "<C-w>-")
vim.keymap.set("n", "<C-Left>", "<C-w><")
vim.keymap.set("n", "<C-Right>", "<C-w>>")

-- Map previous and next buffers and tabs using [ and ]
vim.keymap.set("n", "[b", vim.cmd.bprevious)
vim.keymap.set("n", "]b", vim.cmd.bnext)

-- Enable folding with the equals sign
vim.keymap.set("n", "=", "za")

-- Fat finger prevention
vim.api.nvim_create_user_command("W", "w", {})
vim.api.nvim_create_user_command("Q", "q", {})

-- Netrw
vim.keymap.set("n", "<leader>e", vim.cmd.Explore)
