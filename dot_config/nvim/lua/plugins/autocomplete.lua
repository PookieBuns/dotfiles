require("mini.completion").setup()
require("mini.keymap").map_multistep("i", "<Tab>", { "pmenu_next" })
require("mini.keymap").map_multistep("i", "<S-Tab>", { "pmenu_prev" })
require("mini.keymap").map_multistep("i", "<CR>", { "pmenu_accept", "minipairs_cr" })
require("mini.keymap").map_multistep("i", "<BS>", { "minipairs_bs" })
-- Snippets
vim.pack.add({ "https://github.com/rafamadriz/friendly-snippets" })
local snippets = require("mini.snippets")
local gen_loader = require("mini.snippets").gen_loader
snippets.setup({
	snippets = {
		gen_loader.from_lang(),
	},
})
snippets.start_lsp_server({ match = false })
