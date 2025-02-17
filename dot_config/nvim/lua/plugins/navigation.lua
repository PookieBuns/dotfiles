return {
	-- tmux integration
	"christoomey/vim-tmux-navigator",
	-- File Explorer
	{
		"echasnovski/mini.files",
		opts = {
			mappings = {
				go_in_plus = "<CR>",
			},
		},
		config = function(_, opts)
			local files = require("mini.files")
			files.setup(opts)
			vim.keymap.set("n", "<leader>e", function()
				files.open()
			end, { desc = "Files" })
			vim.api.nvim_create_autocmd("User", {
				pattern = "MiniFilesBufferCreate",
				callback = function(args)
					local map_buf = function(lhs, rhs)
						vim.keymap.set("n", lhs, rhs, { buffer = args.data.buf_id })
					end
					map_buf("<Esc>", MiniFiles.close)
				end,
			})
		end,
	},
	-- motions
	{ "echasnovski/mini.jump", opts = {} },
}
