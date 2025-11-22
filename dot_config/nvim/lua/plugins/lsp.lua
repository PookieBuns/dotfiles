return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			-- Automatically install LSPs and related tools to stdpath for Neovim
			{ "williamboman/mason.nvim", opts = {} },
			{
				"williamboman/mason-lspconfig.nvim",
				opts = {
					ensure_installed = { "lua_ls", "rust_analyzer", "pyright" },
				},
			},
			-- neovim config support
			{ "folke/lazydev.nvim",      opts = {} },
		},
		config = function()
			vim.lsp.config("rust_analyzer", {
				settings = {
					["rust-analyzer"] = {
						check = {
							command = "clippy",
						},
						rustfmt = {
							extraArgs = { "+nightly" },
						},
					}
				}
			})
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
				callback = function(e)
					vim.lsp.inlay_hint.enable(true)
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, {
						desc = "Go to definition",
						buffer = e.buf,
					})
					vim.keymap.set("n", "gh", vim.lsp.buf.hover, { desc = "Show hover", buffer = e.buf })
					vim.keymap.set(
						"i",
						"<C-h>",
						vim.lsp.buf.signature_help,
						{ desc = "Show signature help", buffer = e.buf }
					)
					vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action", buffer = e.buf })
					vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename", buffer = e.buf })
					-- diagnostics
					vim.diagnostic.config({
						float = {
							source = true,
						},
					})
					vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic", buffer = e.buf })
					vim.keymap.set(
						"n",
						"[d",
						vim.diagnostic.goto_prev,
						{ desc = "Previous diagnostic", buffer = e.buf }
					)
					vim.keymap.set(
						"n",
						"<leader>d",
						vim.diagnostic.setqflist,
						{ desc = "Show diagnostics", buffer = e.buf }
					)
				end,
			})
		end,
	},
}
