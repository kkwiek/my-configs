return {
	{
		"hrsh7th/cmp-nvim-lsp",
	},
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
			{ "ray-x/cmp-treesitter", lazy = true },
		},
	},
	{
		"hrsh7th/nvim-cmp",
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load()

			local cmp = require("cmp")
			local cmp_select = { behavior = cmp.SelectBehavior.Select }
			local luasnip = require("luasnip")

			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					["<Tab>"] = cmp.mapping(function(fallback)
						if luasnip.jumpable(1) then
							luasnip.jump(1)
						else
							fallback()
						end
					end, { "i", "s" }),

					["<S-Tab>"] = cmp.mapping(function(fallback)
						if luasnip.jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, { "i", "s" }),

					["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
					["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
					["<C-y>"] = cmp.mapping.confirm({ select = true }),
					["<C-Space>"] = cmp.mapping.complete(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
				}),
				sources = cmp.config.sources({
					-- { name = "luasnip" },
					-- { name = "nvim_lsp" },
					-- { name = "treesitter", max_item_count = 5 },
					{
						name = "luasnip",
						priority = 150,
						group_index = 1,
						option = { show_autosnippets = true, use_show_condition = false },
					},
					{
						name = "nvim_lsp",
						priority = 100,
						group_index = 1,
					},
					{
						name = "treesitter",
						max_item_count = 5,
						priority = 90,
						group_index = 5,
						entry_filter = function(entry, vim_item)
							if entry.kind == 15 then
								local cursor_pos = vim.api.nvim_win_get_cursor(0)
								local line = vim.api.nvim_get_current_line()
								local next_char = line:sub(cursor_pos[2] + 1, cursor_pos[2] + 1)
								if next_char == '"' or next_char == "'" then
									vim_item.abbr = vim_item.abbr:sub(1, -2)
								end
							end
							return vim_item
						end,
					},
				}, {
					{ name = "buffer" },
				}),
			})
		end,
	},
}

