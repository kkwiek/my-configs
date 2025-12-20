local utilNavigate = require("../utils/file_navigate")

vim.keymap.set("n", "]f", function()
	utilNavigate.navigate_file("next")
end)
vim.keymap.set("n", "[f", function()
	utilNavigate.navigate_file("prev")
end)

-- neo-tree
vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal float<CR>", { desc = "Show Neotree" })

-- undotree
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

-- LSP
vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
vim.keymap.set("n", "gre", vim.diagnostic.open_float, {})
vim.keymap.set("n", "grd", vim.lsp.buf.definition, {})

vim.keymap.set("n", "<leader>bf", function()
	vim.lsp.buf.format({
		async = false,
		filter = function(client)
			return client.name ~= "ts_ls"
		end
	})
end, {})

-- debugging.lua
-- telescope.lua

-- custom
vim.keymap.set("n", "G", "Gzz")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "J", "mzJ`z")

-- https://vim.fandom.com/wiki/Quickly_adding_and_deleting_empty_lines
-- Delete next blank line
vim.keymap.set("n", "<C-j>", "m`:silent +g/\\m^\\s*$/d<CR>``:noh<CR>", { noremap = true, silent = true, expr = false })
-- Delete previous blank line
vim.keymap.set("n", "<C-k>", "m`:silent -g/\\m^\\s*$/d<CR>``:noh<CR>", { noremap = true, silent = true, expr = false })
-- Insert new line below (with paste mode to avoid autoindent)
vim.keymap.set("n", "<A-j>", ":set paste<CR>m`o<Esc>``:set nopaste<CR>", { noremap = true, silent = true })
-- Insert new line above (with paste mode)
vim.keymap.set("n", "<A-k>", ":set paste<CR>m`O<Esc>``:set nopaste<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
