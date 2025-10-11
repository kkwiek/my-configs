return {
	{
		"tpope/vim-fugitive",
	},
	{
		"sindrets/diffview.nvim",
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({
				numhl = true,
				on_attach = function(bufnr)
					local gitsigns = require("gitsigns")

					local function map(mode, l, r, opts)
						opts = opts or {}
						opts.buffer = bufnr
						vim.keymap.set(mode, l, r, opts)
					end

					-- Navigation
					map("n", "]c", function()
						if vim.wo.diff then
							vim.cmd.normal({ "]c", bang = true })
						else
							gitsigns.nav_hunk("next")
						end
					end)

					map("n", "[c", function()
						if vim.wo.diff then
							vim.cmd.normal({ "[c", bang = true })
						else
							gitsigns.nav_hunk("prev")
						end
					end)

					-- Actions
					map("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", {})
					map("n", "<leader>gr", gitsigns.reset_hunk)
					map("n", "<leader>gb", function()
						gitsigns.blame_line()
					end)
				end,
			})
		end,
	},
}
