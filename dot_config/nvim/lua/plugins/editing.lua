-- bracket closing
require("mini.pairs").setup()

-- surround
require("mini.surround").setup()

-- textobj
require("mini.ai").setup({
	custom_textobjects = {
		e = require("mini.extra").gen_ai_spec.buffer(),
	},
})

-- undotree
vim.cmd("packadd nvim.undotree")
vim.keymap.set("n", "<leader>u", "<cmd>Undotree<cr>")
