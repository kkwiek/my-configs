vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set expandtab")

vim.o.autoindent = true
vim.o.smartindent = true
vim.o.copyindent = true      -- copy indent structure from previous line
vim.o.preserveindent = true  -- keep as much indent as possible
-- vim.opt.virtualedit = "onemore"

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.g.background = "light"
vim.opt.termguicolors = true

vim.wo.number = true
vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.incsearch = true

vim.opt.scrolloff = 8
vim.opt.colorcolumn = "80,120"

vim.o.undofile = true
-- vim.opt.swapfile = false
-- vim.opt.backup = false
-- vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "go",
--   callback = function()
--     vim.opt.spell = true     -- Enable spell checking
--     vim.opt.spellcapcheck = "" -- Disable spellcapcheck
--   end,
-- })
--
-- vim.opt.spelllang = "en_us"
-- vim.opt.spell = true
-- vim.opt.spellcapcheck = ""
-- vim.cmd([[
--   highlight SpellBad gui=undercurl guisp=Red
--   highlight SpellCap gui=undercurl guisp=Blue
--   highlight SpellRare gui=undercurl guisp=Yellow
--   highlight SpellLocal gui=undercurl guisp=Green
-- ]])
--
-- -- Enable spell checking for specific file types
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = { "javascript", "python", "lua", "golang", "go" },
--   callback = function()
--     vim.opt.spell = true -- Enable spell checking
--     vim.opt.spellcapcheck = "" -- Disable spellcapcheck
--   end,
-- })
