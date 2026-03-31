require("mini.files").setup({
	mappings = {
		go_in_plus = "<CR>",
		close = "<ESC>",
	},
})

require("mini.jump").setup()

vim.pack.add({ "https://github.com/christoomey/vim-tmux-navigator" })
