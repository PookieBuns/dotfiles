return {
	"stevearc/conform.nvim",
	cmd = { "Format", "ConformInfo" },
	-- Everything in opts will be passed to setup()
	opts = {
		-- Define your formatters
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "isort", "black" },
			sh = { "shfmt" },
		},
		log_level = vim.log.levels.INFO,
		notify_on_error = true,
	},
	config = function(_, opts)
		require("conform").setup(opts)
		vim.api.nvim_create_user_command("Format", function(args)
			local range = nil
			if args.count ~= -1 then
				local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
				range = {
					start = { args.line1, 0 },
					["end"] = { args.line2, end_line:len() },
				}
			end
			local formatted = require("conform").format({ async = true, lsp_fallback = false, range = range })
			if formatted then
				print("Formatted with Conform")
			else
				print("Using LSP formatting")
				vim.lsp.buf.format()
			end
		end, { range = true })
	end,
}
