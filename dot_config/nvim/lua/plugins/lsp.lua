return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			-- Automatically install LSPs and related tools to stdpath for Neovim
			{ "williamboman/mason.nvim", config = true },
			"williamboman/mason-lspconfig.nvim",
			-- neovim config support
			{ "folke/neodev.nvim",       config = true },
			{ "j-hui/fidget.nvim",       config = true },
		},
		config = function()
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
				callback = function(e)
					local opts = { buffer = e.buf }
					local has_telescope, telescope = pcall(require, "telescope.builtin")
					vim.keymap.set("n", "gd", function()
						if has_telescope then
							telescope.lsp_definitions()
						else
							vim.lsp.buf.definition()
						end
					end, opts)
					vim.keymap.set("n", "gh", vim.lsp.buf.hover, opts)
					vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
					vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
					vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
					-- diagnostics
					vim.diagnostic.config({
						float = {
							source = true
						},
					})
					vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
					vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
					vim.keymap.set("n", "<leader>d", function()
						if has_telescope then
							telescope.diagnostics({ bufnr = 0 })
						else
							vim.diagnostic.setloclist()
						end
					end, opts)
				end,
			})
			local has_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
			local capabilities = vim.tbl_deep_extend(
				"force",
				{},
				vim.lsp.protocol.make_client_capabilities(),
				has_cmp and cmp_nvim_lsp.default_capabilities() or {}
			)
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "rust_analyzer", "pyright" },
				handlers = {
					function(server_name) -- default handler (optional)
						require("lspconfig")[server_name].setup({
							capabilities = capabilities,
						})
					end,

					["rust_analyzer"] = function()
						require("lspconfig").rust_analyzer.setup({
							capabilities = capabilities,
							settings = {
								["rust-analyzer"] = {
									check = {
										command = "clippy",
										extraArgs = {
											"--",
											"-Wclippy::pedantic",
											"-Aclippy::must_use_candidate",
											"-Aclippy::missing_errors_doc",
										},
									},
									rustfmt = {
										extraArgs = { "+nightly" },
									},
								},
							},
						})
					end,
				},
			})
		end,
	},
}
