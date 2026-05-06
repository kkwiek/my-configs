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

vim.opt.exrc = true
vim.opt.secure = true
vim.opt.shadafile = ".vim/project.shada"
vim.opt.completeopt = { "menu", "menuone", "noselect" }

vim.api.nvim_create_autocmd("SwapExists", {
  callback = function()
    local swap = vim.v.swapname
    if vim.fn.getftime(swap) > os.time() - 600 then
      vim.v.swapchoice = "r"
    else
      vim.v.swapchoice = "e"
    end
  end,
})

-- vim.opt.swapfile = false
-- vim.opt.backup = false
-- vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

