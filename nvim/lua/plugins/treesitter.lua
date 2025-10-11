return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
	},
	config = function()
		local configs = require("nvim-treesitter.configs")
		configs.setup({
			auto_install = true,
			ensure_installed = {
				"lua",
				"vim",
				"vimdoc",
				"sql",
				"typescript",
				"javascript",
				"json",
				"html",
				"go",
				"gomod",
				"gowork",
				"gosum",
				"markdown",
				"markdown_inline",
			},
			sync_install = false,
			highlight = { enable = true },
			indent = { enable = true },
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-space>",
					node_incremental = "<C-space>",
					scope_incremental = false,
					node_decremental = "<bs>",
				},
			},
		})
	end,
}
