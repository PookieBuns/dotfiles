require("mini.pick").setup({
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
})

local map_leader = function(mode, suffix, rhs)
	vim.keymap.set(mode, "<Leader>" .. suffix, rhs)
end

map_leader("n", "ff", function()
	require("mini.pick").builtin.files()
end)

map_leader("n", "fg", function()
	require("mini.pick").builtin.grep_live()
end)

map_leader("n", "fb", function()
	require("mini.pick").builtin.buffers()
end)

map_leader("n", "fh", function()
	require("mini.pick").builtin.help()
end)

map_leader("n", "fd", function()
	require("mini.extra").pickers.diagnostic()
end)
