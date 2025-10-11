return {
	cmd = { "stylua", "--lsp" },
	filetypes = { "lua" },
	root_markers = { ".stylua.toml", "stylua.toml", ".editorconfig" },
	timeout = 5000,
	root_dir = function(bufnr, on_dir)
		local root = vim.fs.root(bufnr, { "stylua.toml", ".git" }) or vim.fn.getcwd()
		on_dir(root)
	end,
}
