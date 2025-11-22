return {
	"stevearc/conform.nvim",
	cmd = { "Format", "ConformInfo" },
	-- Everything in opts will be passed to setup()
	opts = {
		-- Define your formatters
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "ruff_organize_imports", "ruff_format" },
			sh = { "shfmt" },
			markdown = { "prettier" },
			yaml = { "prettier" },
			json = { "prettier" },
			toml = { "taplo" },
			html = { "prettier" },
		},
		log_level = vim.log.levels.INFO,
		notify_on_error = true,
	},
	config = function(_, opts)
		require("conform").setup(opts)
		vim.api.nvim_create_user_command("Format", function()
			local formatted = require("conform").format()
			if formatted then
				vim.notify("Formatted with Conform", vim.log.levels.INFO)
			else
				vim.notify("Using LSP formatting", vim.log.levels.INFO)
				vim.lsp.buf.format()
			end
		end, {})
	end,
}
