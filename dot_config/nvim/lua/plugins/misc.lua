return {
	-- Markdown Preview
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},
	-- Wakatime
	"wakatime/vim-wakatime",
	{
		"HakonHarnes/img-clip.nvim",
		keys = {
			-- suggested keymap
			{ "<leader>p", "<cmd>PasteImage<cr>", desc = "Paste image from system clipboard" },
		},
	},
	-- clues
	{
		"echasnovski/mini.clue",
		opts = {
			triggers = {
				-- Leader triggers
				{ mode = "n", keys = "<Leader>" },
				{ mode = "x", keys = "<Leader>" },
				-- Surround triggers
				{ mode = "n", keys = "s" },
				{ mode = "x", keys = "s" },
			},
		},
	},
}
