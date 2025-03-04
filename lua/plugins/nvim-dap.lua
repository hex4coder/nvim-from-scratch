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
		end,
	},
	{
		"leoluz/nvim-dap-go",
		ft = "go",
		dependencies = { "mfussenegger/nvim-dap" },
		config = function()
			require("dap-go").setup({
				["<leader>db"] = { "<cmd>DapToggleBreakpoint<cr>", "Add breakpoint at line" },
				["<leader>dus"] = {
					function()
						local widgets = require("dap.ui.widgets")
						local sidebar = widgets.sidebar(widgets.scopes)
						sidebar.open()
					end,
					"start debugging go",
				},
			})
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
