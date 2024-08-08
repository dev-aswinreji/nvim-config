local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettier" },   -- Uncommented for CSS formatting
    html = { "prettier" },  -- Uncommented for HTML formatting
    javascript = { "prettier" },  -- Added for JavaScript formatting
    typescript = { "prettier" },  -- Added for TypeScript formatting
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return options
