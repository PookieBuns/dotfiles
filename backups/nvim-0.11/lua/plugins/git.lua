return {
	-- git commands
	{
		"tpope/vim-fugitive",
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
		config = function()
			local Popup = require("nui.popup")
			local event = require("nui.utils.autocmd").event
			local popup = Popup({
				enter = true,
				focusable = true,
				border = {
					style = "rounded",
				},
				position = "50%",
				size = {
					width = "80%",
					height = "60%",
				},
			})
			local function get_git_index_file()
				local git_dir = vim.fn.systemlist("git rev-parse --git-dir")[1]
				if vim.v.shell_error ~= 0 then
					return nil, "Not a git repository"
				end
				local index_file = git_dir .. "/index"
				return index_file, nil
			end
			vim.api.nvim_create_user_command("G", function()
				local index_file, err = get_git_index_file()
				if err ~= nil then
					vim.notify("Error: " .. err, vim.log.levels.ERROR)
					return
				end
				popup:mount()
				vim.cmd("edit " .. index_file)
				-- unmount component when cursor leaves buffer
				popup:on(event.BufLeave, function()
					popup:unmount()
				end)
			end, {})
		end,
	},
	{
		"echasnovski/mini.diff",
		opts = {
			view = {
				style = "sign",
				signs = {
					add = "▎",
					change = "▎",
					delete = "",
				},
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
		},
		config = function(_, opts)
			require("mini.diff").setup(opts)
			vim.keymap.set("n", "<leader>go", function()
				require("mini.diff").toggle_overlay(0)
			end, { desc = "Toggle mini.diff overlay" })
		end,
	},
	{
		"rbong/vim-flog",
		lazy = true,
		cmd = { "Flog", "Flogsplit", "Floggit" },
		dependencies = {
			"tpope/vim-fugitive",
		},
	},
}
