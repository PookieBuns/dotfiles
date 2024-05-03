return {
	{
		"mhartington/formatter.nvim",
		config = function()
			local filetypes = require("formatter.filetypes")
			require("formatter").setup({
				logging = true,
				log_level = vim.log.levels.DEBUG,
				filetype = {
					python = filetypes.python.black,
					lua = filetypes.lua.stylua,
					["*"] = function ()
						vim.lsp.buf.format()
						return nil
					end
				},
			})
		end,
	},
}
