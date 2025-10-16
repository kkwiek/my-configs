vim.lsp.enable "css_ls"
vim.lsp.enable "eslint"
vim.lsp.enable "gopls"
vim.lsp.enable "html_ls"
vim.lsp.enable "jsonls"
vim.lsp.enable "lua_ls"
vim.lsp.enable "ts_ls"
-- vim.lsp.enable "sqlls"

-- vim.api.nvim_create_autocmd("LspAttach", {
-- 	callback = function(ev)
-- 		local client = vim.lsp.get_client_by_id(ev.data.client_id)
-- 		if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_completion) then
-- 			vim.opt.completeopt = { "menu", "menuone", "noinsert", "fuzzy", "popup" }
-- 			vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
-- 			vim.keymap.set("i", "<C-Space>", function()
-- 				vim.lsp.completion.get()
-- 			end)
-- 		end
-- 	end,
-- })

-- Diagnostics
vim.diagnostic.config {
  virtual_text = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    border = "rounded",
    source = true,
  },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "󰅚 ",
      [vim.diagnostic.severity.WARN] = "󰀪 ",
      [vim.diagnostic.severity.INFO] = "󰋽 ",
      [vim.diagnostic.severity.HINT] = "󰌶 ",
    },
    numhl = {
      [vim.diagnostic.severity.ERROR] = "ErrorMsg",
      [vim.diagnostic.severity.WARN] = "WarningMsg",
    },
  },
}
