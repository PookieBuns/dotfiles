return {
	{
		"echasnovski/mini.pick",
		dependencies = { "echasnovski/mini.extra" },
		opts = {
			mappings = {
				move_down = "<C-j>",
				move_up = "<C-k>",
				choose_marked = "<C-q>",
			},
			window = {
				config = function()
					local height = math.floor(0.618 * vim.o.lines)
					local width = math.floor(0.618 * vim.o.columns)
					return {
						anchor = "NW",
						height = height,
						width = width,
						row = math.floor(0.5 * (vim.o.lines - height)),
						col = math.floor(0.5 * (vim.o.columns - width)),
					}
				end,
			},
		},
		keys = {
			{
				"<leader>ff",
				function()
					require("mini.pick").builtin.files()
				end,
			},
			{
				"<leader>fg",
				function()
					require("mini.pick").builtin.grep_live()
				end,
			},
			{
				"<leader>fb",
				function()
					require("mini.pick").builtin.buffers()
				end,
			},
			{
				"<leader>fh",
				function()
					require("mini.pick").builtin.help()
				end,
			},
			{
				"<leader>fd",
				function()
					require("mini.extra").pickers.diagnostic()
				end,
			},
		},
	},
}
