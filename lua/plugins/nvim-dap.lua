return {
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
    config = function()
      require("dapui").setup()

      -- binding
      local dap, dapui = require("dap"), require("dapui")
      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end

      -- key binding
      vim.keymap.set("v", "<M-k>", '<cmd>lua require("dapui").eval()<cr>', { noremap = true })
      vim.keymap.set({ "v", "n" }, "<F5>", dap.continue, { noremap = true })
      vim.keymap.set({ "v", "n" }, "<leader>b", dap.set_breakpoint, { noremap = true })
      vim.keymap.set({ "v", "n" }, "<leader>n", dap.run_to_cursor, { noremap = true })

      -- adapters configs
      dap.adapters.dart = {
        type = "executable",
        command = "dart",
        args = { "debug_adapter" },
      }

      dap.configurations.dart = {
        {
          type = "dart",
          name = "Flutter Run",
          request = "launch",
          program = "${workspaceFolder}/lib/main.dart",
        },
        {
          type = "dart",
          name = "Flutter Attach",
          request = "attach",
        },
      }
    end,
  },
  {
    "leoluz/nvim-dap-go",
    config = function()
      require("dap-go").setup()
    end,
  },
  {
    "folke/lazydev.nvim",
    ft = "lua", -- only load on lua files
    config = function()
      require("lazydev").setup({
        library = { "nvim-dap-ui" },
      })
    end,
  },
}
