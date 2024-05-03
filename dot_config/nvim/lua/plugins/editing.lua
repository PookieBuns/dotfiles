return {
	-- comment
	{ "numToStr/Comment.nvim", config = true },
	-- auto detect shiftwidth and tabstop
	"tpope/vim-sleuth",
	-- surround
	"tpope/vim-surround",
	-- bracket closing
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
	},
	-- textobj
	{
		"kana/vim-textobj-entire",
		dependencies = {
			"kana/vim-textobj-user",
		},
	},
	-- undo tree
	{
		"mbbill/undotree",
		keys = {
			{ "<leader>u", "<cmd>UndotreeToggle<CR>" },
		},
	},
}
