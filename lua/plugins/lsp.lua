return {
  -- LSP installer & manager
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",        -- Lua
          "pyright",       -- Python
          "ts_ls",         -- JS/TypeScript
          "bashls",        -- Bash
          "cssls",         -- CSS
          "html",          -- HTML
        },
        automatic_installation = true,
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local servers = { "lua_ls", "pyright", "ts_ls", "bashls", "cssls", "html" }
      
      -- Modern Neovim 0.11+ Setup
      for _, server in ipairs(servers) do
        vim.lsp.config(server, {
          capabilities = capabilities,
        })
        vim.lsp.enable(server)
      end

      -- Keymaps (only active when LSP attaches)
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(e)
          local opts = { buffer = e.buf }
          vim.keymap.set("n", "gd",         vim.lsp.buf.definition, opts)       -- go to definition
          vim.keymap.set("n", "K",          vim.lsp.buf.hover, opts)            -- show docs
          vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)           -- rename symbol
          vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)       -- code action
          vim.keymap.set("n", "gr",         vim.lsp.buf.references, opts)       -- references
          vim.keymap.set("n", "[d",         vim.diagnostic.goto_prev, opts)     -- prev error
          vim.keymap.set("n", "]d",         vim.diagnostic.goto_next, opts)     -- next error
          vim.keymap.set("n", "<leader>d",  vim.diagnostic.open_float, opts)    -- show error
        end,
      })
    end,
  },
}
