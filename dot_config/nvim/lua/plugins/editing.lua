-- bracket closing
require("mini.pairs").setup()
-- surround
require("mini.surround").setup()
--textobj
require("mini.ai").setup({
	custom_textobjects = {
		e = require("mini.extra").gen_ai_spec.buffer(),
	},
})
