-- icons
require("mini.icons").setup()
-- status line
require("mini.statusline").setup()
-- indent line
require("mini.indentscope").setup({
	draw = {
		animation = function()
			return 0
		end,
	},
})
-- notifications
require("mini.notify").setup()
-- hlpatterns
require("mini.hipatterns").setup({
	highlighters = {
		fixme = { pattern = "FIXME", group = "MiniHipatternsFixme" },
		hack = { pattern = "HACK", group = "MiniHipatternsHack" },
		todo = { pattern = "TODO", group = "MiniHipatternsTodo" },
		note = { pattern = "NOTE", group = "MiniHipatternsNote" },
	},
})
