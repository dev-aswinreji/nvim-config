
-- Load default LSP settings from NvChad
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"
local nvlsp = require "nvchad.configs.lspconfig"

-- List of LSP servers to configure with default settings
local servers = { "html", "cssls", "tsserver" }

-- Configure LSP servers with default settings
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

-- Custom configuration for tsserver
lspconfig.tsserver.setup {
  on_attach = function(client, bufnr)
    -- Use default on_attach provided by NvChad
    nvlsp.on_attach(client, bufnr)

    -- Disable tsserver's formatting capabilities if using an external formatter
    client.server_capabilities.documentFormattingProvider = false
  end,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  settings = {
    -- Customize settings for tsserver if needed
    completions = {
      completeFunctionCalls = true,
    },
  },
}

