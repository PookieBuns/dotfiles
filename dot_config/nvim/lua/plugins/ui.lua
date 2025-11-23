return {
	-- icons
	{ "echasnovski/mini.icons",      opts = {} },
	-- Status Line
	{ "echasnovski/mini.statusline", opts = {} },
	-- Indent Line
	{
		"echasnovski/mini.indentscope",
		opts = {
			draw = {
				animation = function()
					return 0
				end,
			},
		},
	},
	-- Notifications
	{
		"echasnovski/mini.notify",
		opts = {},
		config = function(_, opts)
			require("mini.notify").setup(opts)
			vim.notify = require("mini.notify").make_notify()
		end,
	},
}
