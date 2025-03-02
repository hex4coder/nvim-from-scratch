return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({})
		end
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls" },
				automatic_installation = true,
			})
		end

	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")


			-- lua
			lspconfig.lua_ls.setup({})
			-- php
			lspconfig.intelephense.setup({})
			-- go
			lspconfig.gopls.setup({})
			-- ast grep
			lspconfig.ast_grep.setup({})








			-- key mappings
			local map = vim.keymap.set
			map('n', '<leader>cf', vim.lsp.buf.format, { desc = 'Formatting code with lsp' })
			map('n', '<leader>ca', vim.lsp.buf.code_action, { desc = 'Code action with lsp' })
			map('n', '<F2>', vim.lsp.buf.rename, { desc = 'rename with lsp' })
			map('n', 'K', vim.lsp.buf.hover, { desc = 'hover code with lsp' })
		end

	},
}
