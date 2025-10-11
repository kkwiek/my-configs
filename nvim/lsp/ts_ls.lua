return {
  cmd = { "typescript-language-server", "--stdio" },
  root_markers = {
    "package.json",
  },
  filetypes = {
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescriptreact",
    "typescript.tsx",
  },
  settings = {
    typescript = {
      inlayHints = { enable = false }
    },
    javascript = {
      inlayHints = { enable = false }
    }
  },
  on_init = function(client)
    -- Disable tsserver diagnostics and formatting
    client.server_capabilities.diagnosticProvider = false
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
  end
}
