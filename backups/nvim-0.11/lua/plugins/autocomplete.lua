return {
	{
		"nvim-mini/mini.completion",
		dependencies = {
			"nvim-mini/mini.keymap",
		},
		opts = {},
		config = function(_, opts)
			require("mini.completion").setup(opts)
			local map_multistep = require('mini.keymap').map_multistep
			map_multistep('i', '<Tab>', { 'pmenu_next' })
			map_multistep('i', '<S-Tab>', { 'pmenu_prev' })
			map_multistep('i', '<CR>', { 'pmenu_accept', 'minipairs_cr' })
			map_multistep('i', '<BS>', { 'minipairs_bs' })
		end,
	},
	{
		"zbirenbaum/copilot.lua",
		opts = {
			suggestion = {
				auto_trigger = true,
				hide_during_completion = false,
				keymap = {
					accept = "<C-CR>",
					next = "<C-j>",
					prev = "<C-k>",
				},
			},
		},
	},
}
