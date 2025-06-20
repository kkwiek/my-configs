return {
  {
    "folke/trouble.nvim",
    tag = "v3.6.0",
    config = function()
      require("trouble").setup({})

      vim.keymap.set(
        "n",
        "<leader>tt",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        { desc = "Toggle current buffer diagnostics" }
      )

      vim.keymap.set(
        "n",
        "<leader>tta",
        "<cmd>Trouble diagnostics toggle<cr>",
        { desc = "Toggle all trouble diagnostics" }
      )

      -- vim.keymap.set("n", "[d", function()
      --   require("trouble").next({ skip_groups = true, jump = true, mode = "diagnostics"})
      -- end)
      --
      -- vim.keymap.set("n", "]d", function()
      --   require("trouble").previous({ skip_groups = true, jump = true, mode = "diagnostics" })
      -- end)
    end,
  },
}
