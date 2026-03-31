vim.pack.add({ "https://github.com/stevearc/conform.nvim" })
require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "ruff_organize_imports", "ruff_format" },
		sh = { "shfmt" },
		markdown = { "prettier" },
		yaml = { "prettier" },
		json = { "prettier" },
		toml = { "taplo" },
		html = { "prettier" },
		avsc = { "prettier" },
		js = { "prettier" },
	},
})
vim.api.nvim_create_user_command("Format", function()
	local formatted = require("conform").format()
	if formatted then
		vim.notify("Formatted with Conform", vim.log.levels.INFO)
	else
		vim.notify("Using LSP formatting", vim.log.levels.INFO)
		vim.lsp.buf.format()
	end
end, {})
