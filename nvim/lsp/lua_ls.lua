return {
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  root_markers = { { ".luarc.json", ".luarc.jsonc" }, ".git" },
  settings = {
    Lua = {
      format = {
        enable = true,
        defaultConfig = {
          indent_style = "space",          -- "space" | "tab"
          indent_size = "2",               -- number of spaces
          continuation_indent_size = "2",
          quote_style = "double",          -- "single" | "double"
          call_arg_parentheses = "remove", -- "keep" | "remove"
          chop_down_table = "true",        -- multiline tables
          line_width = "100",              -- max line length
          keep_simple_function_one_line = "true",
          break_after_functioncall_lp = "false",
          break_before_functioncall_rp = "false",
        },
      },
      runtime = {
        version = 'LuaJIT',
      },
      diagnostics = {
        globals = { "vim" },
      },
      hint = { enable = true },
      telemetry = { enable = false },
    },
  },
  single_file_support = true,
  log_level = vim.lsp.protocol.MessageType.Warning,
}
