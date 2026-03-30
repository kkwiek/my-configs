return {
	"nvim-mini/mini.nvim",
	version = false,
	config = function()
		require("mini.ai").setup({
			n_lines = 500,
			search_method = "cover_or_nearest",
		})
	end,
}
