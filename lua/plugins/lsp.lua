return {
  {
    "williamboman/mason.nvim",
    opts = { ensure_installed = { "gopls" } },
    config = function()
      require("mason").setup({})
    end,
  },
  { "williamboman/mason-lspconfig.nvim" },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "saghen/blink.cmp",
    },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls" },
        automatic_installation = true,
      })
      print("calling lsp.....")
      require("mason-lspconfig").setup()
      require("mason-lspconfig").setup_handlers({
        -- The first entry (without a key) will be the default handler
        -- and will be called for each installed server that doesn't have
        -- a dedicated handler.
        function(server_name) -- default handler (optional)
          -- register blink cmp caps
          local lsp_capabilities = require("blink.cmp").get_lsp_capabilities()
          require("lspconfig")[server_name].setup({
            capabilities = lsp_capabilities,
          })
        end,
        -- Next, you can provide a dedicated handler for specific servers.
        -- For example, a handler override for the `rust_analyzer`:
        ["gopls"] = function()
          require("lspconfig").gopls.setup({
            completeUnimported = true,
            usePlaceholders = true,
            analyses = { unusedparams = true },
          })
        end,
        --     ["rust_analyzer"] = function()
        --require("rust-tools").setup({})
        -- end,
      })
      -- mapping keyboards
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "go to defenition", noremap = true })
      vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "go to defenition", noremap = true })
    end,
  },
}
