-- buffers navigation
-- vim.keymap.set("n", "<C-h>", "<cmd>bprev<CR>", {})
-- vim.keymap.set("n", "<C-l>", "<cmd>bnext<CR>", {})
-- vim.keymap.set("n", "<C-DEL>", "<cmd>bprev<CR><cmd>bdelete#<CR>", {})

-- neo-tree
-- vim.keymap.set("n", "<C-t>", ":Neotree filesystem reveal toggle left<CR>", { desc = "Toggle Neotree" })
vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal float<CR>", { desc = "Show Neotree" })

-- undotree
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

-- lsp
vim.keymap.set("n", "<leader>cn", vim.lsp.buf.rename, {})
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
vim.keymap.set("n", "<leader>cd", vim.lsp.buf.definition, {})
vim.keymap.set("n", "<leader>cr", vim.lsp.buf.references, {})
vim.keymap.set("n", "<leader>ci", vim.lsp.buf.implementation, {})
vim.keymap.set("n", "K", vim.lsp.buf.hover, {})

vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, {})
vim.keymap.set("n", "<leader>]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<leader>[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })

-- none-ls
vim.keymap.set("n", "<leader>bf", function()
  -- Never request typescript-language-server for formatting
  vim.lsp.buf.format({
    async = false,
    filter = function(client)
      return client.name ~= "ts_ls"
    end,
  })
end, {})

-- Toggle spell checking with <leader>s
-- vim.keymap.set("n", "<leader>s", function()
-- 	vim.opt.spell = not vim.opt.spell:get()
-- end, { desc = "Toggle spell checking" })
--
-- debugging.lua
-- telescope.lua
-- harpoon.lua

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
