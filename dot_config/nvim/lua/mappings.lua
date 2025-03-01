vim.g.mapleader = " "
vim.keymap.set("i", "jk", "<Esc>")

-- miscellaneous
vim.keymap.set({ "n", "v", "o" }, "<leader>l", "$", { desc = "Move to end of line" })
vim.keymap.set({ "n", "v", "o" }, "<leader>h", "^", { desc = "Move to beginning of line" })

-- Resize split windows using arrow keys by pressing:
-- CTRL+UP, CTRL+DOWN, CTRL+LEFT, or CTRL+RIGHT.
vim.keymap.set("n", "<C-Up>", "<C-w>+")
vim.keymap.set("n", "<C-Down>", "<C-w>-")
vim.keymap.set("n", "<C-Left>", "<C-w><")
vim.keymap.set("n", "<C-Right>", "<C-w>>")

-- Map previous and next buffers and tabs using [ and ]
vim.keymap.set("n", "[b", vim.cmd.bprevious)
vim.keymap.set("n", "]b", vim.cmd.bnext)
-- Map previous and next quickfix using [ and ]
vim.keymap.set("n", "[q", vim.cmd.cprevious)
vim.keymap.set("n", "]q", vim.cmd.cnext)

-- Enable folding with the equals sign
vim.keymap.set("n", "=", "za")

-- Fat finger prevention
vim.api.nvim_create_user_command("W", "w", {})
vim.api.nvim_create_user_command("Q", "q", {})

-- Difftool
vim.keymap.set("n", "<leader>1", ":diffget LOCAL<CR>", { desc = "get LOCAL" })
vim.keymap.set("n", "<leader>2", ":diffget BASE<CR>", { desc = "get BASE" })
vim.keymap.set("n", "<leader>3", ":diffget REMOTE<CR>", { desc = "get REMOTE" })
