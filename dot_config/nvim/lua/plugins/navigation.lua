require("mini.files").setup({
	mappings = {
		go_in_plus = "<CR>",
		close = "<ESC>",
	},
})
vim.keymap.set("n", "<leader>e", function()
	require("mini.files").open(vim.api.nvim_buf_get_name(0))
end)

require("mini.jump").setup()

vim.pack.add({ "https://github.com/christoomey/vim-tmux-navigator" })
