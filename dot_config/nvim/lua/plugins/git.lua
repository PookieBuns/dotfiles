return {
	-- git commands
	{
		"tpope/vim-fugitive",
		config = function()
			vim.cmd(
				'command! -bang -nargs=? -range=-1 -complete=customlist,fugitive#Completed G ' ..
				'exe fugitive#Command(<line1>, <count>, +"<range>", <bang>0, "<mods>", <q-args>) ' ..
				'| only'
			)
		end
	},
	-- git gutter
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({
				on_attach = function(bufnr)
					local gitsigns = require('gitsigns')

					local function map(mode, l, r, opts)
						opts = opts or {}
						opts.buffer = bufnr
						vim.keymap.set(mode, l, r, opts)
					end

					-- Navigation
					map('n', ']c', function()
						if vim.wo.diff then
							vim.cmd.normal({ ']c', bang = true })
						else
							gitsigns.nav_hunk('next')
						end
					end)

					map('n', '[c', function()
						if vim.wo.diff then
							vim.cmd.normal({ '[c', bang = true })
						else
							gitsigns.nav_hunk('prev')
						end
					end)
				end
			})
		end
	},
}
