return {
	-- tmux integration
	"christoomey/vim-tmux-navigator",
	-- File Explorer
	-- {
	-- 	"nvim-neo-tree/neo-tree.nvim",
	-- 	branch = "v3.x",
	-- 	dependencies = {
	-- 		"nvim-lua/plenary.nvim",
	-- 		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
	-- 		"MunifTanjim/nui.nvim",
	-- 		-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
	-- 	},
	-- 	keys = {
	-- 		{ "<F3>", "<cmd> Neotree toggle<cr>" },
	-- 	},
	-- 	opts = {
	-- 		event_handlers = {
	--
	-- 			{
	-- 				event = "file_opened",
	-- 				handler = function(file_path)
	-- 					-- auto close
	-- 					-- vimc.cmd("Neotree close")
	-- 					-- OR
	-- 					require("neo-tree.command").execute({ action = "close" })
	-- 				end,
	-- 			},
	-- 		},
	-- 	},
	-- },
	-- Oil
	-- {
	-- 	"stevearc/oil.nvim",
	-- 	config = true
	-- },
	-- motions
	{
		"ggandor/leap.nvim",
		config = function()
			vim.keymap.set({ 'n', 'x', 'o' }, 's', '<Plug>(leapforward)')
		end
	}
}
