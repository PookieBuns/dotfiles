return {
	{
		"echasnovski/mini.completion",
		dependencies = { "echasnovski/mini.pairs" },
		opts = {},
		config = function(_, opts)
			require("mini.completion").setup(opts)
			local imap_expr = function(lhs, rhs)
				vim.keymap.set("i", lhs, rhs, { expr = true })
			end
			imap_expr("<Tab>", [[pumvisible() ? "\<C-n>" : "\<Tab>"]])
			imap_expr("<S-Tab>", [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]])

			local keycode = vim.keycode
				or function(x)
					return vim.api.nvim_replace_termcodes(x, true, true, true)
				end
			local keys = {
				["cr"] = keycode("<CR>"),
				["ctrl-y"] = keycode("<C-y>"),
				["ctrl-y_cr"] = keycode("<C-y><CR>"),
			}

			_G.cr_action = function()
				if vim.fn.pumvisible() ~= 0 then
					-- If popup is visible, confirm selected item or add new line otherwise
					local item_selected = vim.fn.complete_info()["selected"] ~= -1
					return item_selected and keys["ctrl-y"] or keys["ctrl-y_cr"]
				else
					-- If popup is not visible, use plain `<CR>`. You might want to customize
					-- according to other plugins. For example, to use 'mini.pairs', replace
					-- next line with `return require('mini.pairs').cr()`
					return require("mini.pairs").cr()
				end
			end

			imap_expr("<CR>", "v:lua._G.cr_action()")
		end,
	},
	{
		"zbirenbaum/copilot.lua",
		opts = {
			suggestion = {
				auto_trigger = true,
				keymap = {
					accept = "<C-CR>",
					next = "<C-j>",
					prev = "<C-k>",
				},
			},
		},
	},
}
