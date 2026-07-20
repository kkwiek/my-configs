-- lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end

vim.opt.rtp:prepend(lazypath)

-- lazy end

require("config.vim-options")
require("config.vim-key-map")
require("config.lsp")
-- require("lazy").setup("plugins")

-- Load local config overrides (gitignored)
local local_init = vim.fn.stdpath("config") .. "/lua/local/init.lua"
if vim.uv.fs_stat(local_init) then
    require("local")
end

-- Setup lazy with plugins + local plugins (if they exists)
local lazy_spec = {{ import = "plugins" }}
local local_plugins = vim.fn.stdpath("config") .. "/lua/local/plugins"
if vim.uv.fs_stat(local_plugins) then
  table.insert(lazy_spec, { import = "local.plugins" })
end
require("lazy").setup(lazy_spec)
