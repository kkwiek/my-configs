return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "v0.2.0",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local builtin = require("telescope.builtin")
			local utils = require("telescope.utils")

			vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope [F]ind [F]iles" })

			vim.keymap.set("n", "<leader>fr", builtin.live_grep, { desc = "Telescope [F]iles live [G]rep" })

			vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope [F]ind [B]uffer" })

			vim.keymap.set("n", "<leader>fg", builtin.git_status, { desc = "Telescope [F]ind [G]it" })

			vim.keymap.set(
				"n",
				"<leader>fs",
				builtin.lsp_dynamic_workspace_symbols,
				{ desc = "Telescope [F]ind [S]ymbols" }
			)

			vim.keymap.set("n", "<leader>df", function()
				builtin.find_files({ cwd = utils.buffer_dir() })
			end, { desc = "Find files in current directory [D]irectory [F]ind" })

			vim.keymap.set("n", "<leader>dg", function()
				builtin.live_grep({ cwd = utils.buffer_dir() })
			end, { desc = "Grep files in current directory [D]irectory [G]rep" })

			vim.keymap.set("n", "<leader>bs", builtin.lsp_document_symbols, { desc = "Find Symbols in current buffer" })
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			local actions = require("telescope.actions")

			require("telescope").setup({
				pickers = {
					find_files = {
						hidden = true,
					},
					buffers = {
						mappings = {
							i = {
								["<C-d>"] = actions.delete_buffer + actions.move_to_bottom,
							},
						},
					},
				},
				defaults = {
					vimgrep_arguments = {
						"rg",
						"--color=never",
						"--no-heading",
						"--with-filename",
						"--line-number",
						"--column",
						"--smart-case",
						"--hidden",
					},
				},
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
}
