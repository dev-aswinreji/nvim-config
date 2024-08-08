
return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- Mason for managing external tools like LSP servers
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "typescript-language-server", "lua_ls", "html", "cssls" },
      })
    end,
  },

  -- DAP for debugging
  {
    "mfussenegger/nvim-dap",
    config = function()
      -- Additional DAP setup can be done here if needed
    end,
  },

  {
    "rcarriga/nvim-dap-ui",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      require("dapui").setup()
    end,
  },

  {
    "mxsdev/nvim-dap-vscode-js",
    dependencies = {"mfussenegger/nvim-dap"},
    config = function()
      require("dap-vscode-js").setup({
        -- Change the path if necessary
        node_path = "node", -- Path of node executable
        debugger_path = vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter",
        adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' },
      })

      for _, language in ipairs({ "typescript", "javascript" }) do
        require("dap").configurations[language] = {
          {
            type = "pwa-node",
            request = "launch",
            name = "Launch file",
            program = "${file}",
            cwd = "${workspaceFolder}",
          },
          {
            type = "pwa-node",
            request = "attach",
            name = "Attach",
            processId = require('dap.utils').pick_process,
            cwd = "${workspaceFolder}",
          },
        }
      end
    end,
  },

  -- Example: Treesitter for syntax highlighting
  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
}

