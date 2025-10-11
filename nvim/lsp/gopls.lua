return {
	cmd = { "gopls" },
	filetypes = { "go", "gomod", "gowork", "gotmpl" },
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
		vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
			underline = true,
			virtual_text = true,
			signs = true,
			update_in_insert = false,
		})
	end,
	init_options = {
		verboseWorkDoneProgress = true, -- Enable verbose logging
	},
}
