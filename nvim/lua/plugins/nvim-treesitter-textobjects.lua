return {
	"nvim-treesitter/nvim-treesitter-textobjects",
	lazy = true,
	config = function()
		require("nvim-treesitter.configs").setup({
			textobjects = {
				select = {
					enable = true,
					lookahead = true,
					keymaps = {
						["af"] = { query = "@function.outer", desc = "Select outer part of a function definition" },
						["if"] = { query = "@function.inner", desc = "Select inner part of a function definition" },

						["ac"] = { query = "@class.outer", desc = "Select outer part of a class" },
						["ic"] = { query = "@class.inner", desc = "Select inner part of a class" },

						["io"] = { query = "@conditional.inner", desc = "Select inner part of if condition" },
						["ao"] = { query = "@conditional.outer", desc = "Select outer part of if condition" },

						["il"] = { query = "@loop.inner", desc = "Select inner part of if loop" },
						["al"] = { query = "@loop.outer", desc = "Select outer part of if loop" },

						["l="] = { query = "@assignment.lhs", desc = "Select left hand side of an assignment" },
						["r="] = { query = "@assignment.rhs", desc = "Select right hand side of an assignment" },

						["as"] = { query = "@statement.outer" },
						["is"] = { query = "@statement.inner" },
					},
				},
				swap = {
					enable = true,
					swap_next = {
						["<leader>na"] = "@parameter.inner", -- swap parameters/argument with next
					},
					swap_previous = {
						["<leader>pa"] = "@parameter.inner", -- swap parameters/argument with prev
					},
				},
				move = {
					enable = true,
					set_jumps = true, -- whether to set jumps in the jumplist
				},
			},
		})
	end,
}
