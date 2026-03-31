vim.pack.add({ "https://github.com/zbirenbaum/copilot.lua" })
require("copilot").setup({
	suggestion = {
		auto_trigger = true,
		hide_during_completion = false,
		keymap = {
			accept = "<C-CR>",
			next = "<C-j>",
			prev = "<C-k>",
		},
	},
})
