return {
  -- SOURCES
  { "hrsh7th/cmp-nvim-lsp", lazy = false },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-path" },
  { "hrsh7th/cmp-cmdline" },
  { "hrsh7th/cmp-nvim-lua" },

  -- SNIPPETS
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
    },
  },

  -- UI
  { "onsails/lspkind.nvim" },

  -- AUTOPAIRS (optional but recommended)
  {
    "windwp/nvim-autopairs",
    config = function()
      require "nvim-autopairs".setup {}
    end,
  },

  -- MAIN CMP
  {
    "hrsh7th/nvim-cmp",
    config = function()
      local cmp = require "cmp"
      local luasnip = require "luasnip"
      local lspkind = require "lspkind"

      require "luasnip.loaders.from_vscode".lazy_load()
      luasnip.config.set_config {
        history = true,
        updateevents = "TextChanged,TextChangedI",
        enable_autosnippets = true,
      }
      -- 🔥 AUTOPAIRS INTEGRATION
      local cmp_autopairs = require "nvim-autopairs.completion.cmp"
      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

      cmp.setup {
        preselect = cmp.PreselectMode.None,
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },

        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },

        mapping = cmp.mapping.preset.insert {
          -- NAVIGATION
          ["<C-n>"] = cmp.mapping.select_next_item(),
          ["<C-p>"] = cmp.mapping.select_prev_item(),

          -- SCROLL DOCS
          ["<C-d>"] = cmp.mapping.scroll_docs(4),
          ["<C-u>"] = cmp.mapping.scroll_docs(-4),

          -- TRIGGER
          ["<C-Space>"] = cmp.mapping.complete(),

          -- CONFIRM
          ["<CR>"] = cmp.mapping.confirm { select = true },

          -- SMART TAB
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { "i", "s" }),

          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        },

        -- 🔥 SORTING
        sorting = {
          priority_weight = 2,
          comparators = {
            -- 🔥 snippet always higher
            function(entry1, entry2)
              if entry1.source.name == "luasnip" and entry2.source.name ~= "luasnip" then
                return true
              elseif entry2.source.name == "luasnip" and entry1.source.name ~= "luasnip" then
                return false
              end
            end,

            require "cmp.config.compare".exact,
            require "cmp.config.compare".score,
            require "cmp.config.compare".recently_used,
            require "cmp.config.compare".locality,
            require "cmp.config.compare".kind,
            require "cmp.config.compare".sort_text,
            require "cmp.config.compare".length,
            require "cmp.config.compare".order,
          },
        },

        -- 🎨 UI (ICONS)
        formatting = {
          format = lspkind.cmp_format {
            mode = "symbol_text",
            maxwidth = 50,
            ellipsis_char = "...",
            before = function(entry, vim_item)
              vim_item.menu = ({
                nvim_lsp = "[LSP]",
                luasnip = "[SNIP]",
                buffer = "[BUF]",
                path = "[PATH]",
                treesitter = "[TREE]",
              })[entry.source.name]
              return vim_item
            end,
          },
        },
        -- 🔥 SOURCES

        sources = cmp.config.sources({
          { name = "luasnip",  priority = 1100, group_index = 1, keyword_length = 2 },
          { name = "nvim_lsp", priority = 1000, group_index = 1, max_item_count = 50 },
          { name = "path",     priority = 500 },
          -- { name = "nvim_lua" },
          -- { name = "treesitter", priority = 1050, group_index = 1, max_item_count = 5 },
        }, {
          { name = "buffer", priority = 250, group_index = 2, keyword_length = 3 },
        }),
      }

      -- 🔥 CMDLINE COMPLETION

      -- `/` search
      cmp.setup.cmdline("/", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "buffer" },
        },
      })

      -- `:` commands
      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path" },
        }, {
          { name = "cmdline" },
        }),
      })
    end,
  },
}
