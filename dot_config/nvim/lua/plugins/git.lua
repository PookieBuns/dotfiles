vim.pack.add({ "https://github.com/tpope/vim-fugitive" })
vim.api.nvim_create_user_command("G", function()
	local height = math.floor(0.618 * vim.o.lines)
	local width = math.floor(0.618 * vim.o.columns)
	local win = vim.api.nvim_open_win(0, true, {
		relative = "win",
		anchor = "NW",
		style = "minimal",
		height = height,
		width = width,
		row = math.floor(0.5 * (vim.o.lines - height)),
		col = math.floor(0.5 * (vim.o.columns - width)),
	})
	vim.cmd("Gedit :")
	-- unmount component when cursor leaves buffer
	local buf = vim.api.nvim_get_current_buf()
	local close_window = function()
		if vim.api.nvim_win_is_valid(win) then
			vim.api.nvim_win_close(win, true)
		end
	end
	vim.api.nvim_create_autocmd({ "BufLeave", "WinLeave" }, {
		buffer = buf,
		once = true,
		callback = close_window,
	})
	vim.keymap.set("n", "<Esc>", close_window, { buffer = buf })
end, {})

require("mini.diff").setup({

	view = {
		style = "sign",
	},
	mappings = {
		-- Apply hunks inside a visual/operator region
		apply = "<leader>gh",

		-- Reset hunks inside a visual/operator region
		reset = "<leader>gH",

		-- Hunk range textobject to be used inside operator
		-- Works also in Visual mode if mapping differs from apply and reset
		textobject = "gh",

		-- Go to hunk range in corresponding direction
		goto_first = "[C",
		goto_prev = "[c",
		goto_next = "]c",
		goto_last = "]C",
	},
})
