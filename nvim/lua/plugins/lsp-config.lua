return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"ts_ls",
					"lua_ls",
					"gopls",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")

			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})
			-- https://github.com/NvChad/NvChad/issues/2016
			lspconfig.ts_ls.setup({
				capabilities = capabilities,
				--on_attach = function(client)
				--	client.resolved_capabilities.document_formatting = false
				--	client.server_capabilities.documentFormattingProvider = false
				--	client.server_capabilities.documentRangeFormattingProvider = false
				--end,
			})
			lspconfig.eslint.setup({})

			lspconfig.gopls.setup({
				capabilities = capabilities,
				settings = {
					gopls = {
						gofumpt = true,
						codelenses = {
							gc_details = false,
							generate = true,
							regenerate_cgo = true,
							run_govulncheck = true,
							test = true,
							tidy = true,
							upgrade_dependency = true,
							vendor = true,
						},
						hints = {
							assignVariableTypes = true,
							compositeLiteralFields = true,
							compositeLiteralTypes = true,
							constantValues = true,
							functionTypeParameters = true,
							parameterNames = true,
							rangeVariableTypes = true,
						},
						staticcheck = true, -- Ensure staticcheck is enabled
						usePlaceholders = true,
						completeUnimported = true,
						semanticTokens = true,
					},
				},
				on_attach = function(client, bufnr)
					-- Enable diagnostics for unused parameters
					vim.lsp.handlers["textDocument/publishDiagnostics"] =
						vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
							underline = true,
							virtual_text = true,
							signs = true,
							update_in_insert = false,
						})
				end,
				init_options = {
					verboseWorkDoneProgress = true, -- Enable verbose logging
				},
			})

			lspconfig.html.setup({
				capabilities = capabilities,
			})
		end,
	},
}
