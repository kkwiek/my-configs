return {
	{
		"fnune/recall.nvim",
		config = function()
			require("recall").setup({
				telescope = {
					autoload = true,
					mappings = {
						unmark_selected_entry = {
							normal = "dd",
							insert = "<C-d>",
						},
					},
				},
			})
			vim.keymap.set("n", "<leader>fm", ":Telescope recall<CR>", { desc = "[F]ind [M]arks" })
		end,
	},
}
