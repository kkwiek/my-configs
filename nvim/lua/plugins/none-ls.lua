return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvimtools/none-ls-extras.nvim",
  },
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        require("none-ls.diagnostics.eslint"),
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.gofmt,
        null_ls.builtins.completion.spell,
        -- null_ls.builtins.diagnostics.codespell.with({
        --   extra_args = { "--check-filenames", "--check-hidden" },
        --   filetypes = { "go", "golang", "javascript", "lua" },
        -- }),
      },
    })
  end,
}
