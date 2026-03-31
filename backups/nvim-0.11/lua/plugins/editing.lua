return {
	-- comment
	{ "echasnovski/mini.comment", opts = {} },
	-- auto detect shiftwidth and tabstop
	"NMAC427/guess-indent.nvim",
	-- surround
	{ "echasnovski/mini.surround", opts = {} },
	-- bracket closing
	{ "echasnovski/mini.pairs", opts = {} },
	-- textobj
	{
		"echasnovski/mini.ai",
		dependencies = { "echasnovski/mini.extra" },
		opts = function()
			return {
				custom_textobjects = {
					-- Select the entire buffer
					e = require("mini.extra").gen_ai_spec.buffer(),
				},
			}
		end,
	},
	-- undo tree
	{
		"mbbill/undotree",
		keys = {
			{ "<leader>u", "<cmd>UndotreeToggle<CR>", desc = "Undo tree" },
		},
		config = function()
			vim.g.undotree_SetFocusWhenToggle = 1
		end,
	},
}
