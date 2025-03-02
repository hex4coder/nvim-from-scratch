return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
		null_ls.setup({

			on_attach = function(client, bufnr)
				if client.supports_method("textDocument/formatting") then
					if bufnr == nil then
						return
					end

					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							-- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
							-- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
							-- vim.lsp.buf.formatting_sync()
							vim.lsp.buf.format({ async = false })
						end,
					})
				end
			end,

			sources = {
				null_ls.builtins.formatting.stylua,
				-- null_ls.builtins.completion.lua_ls,
				--     -- TODO: // masih salah dalam completion code
				-- null_ls.builtins.completion.ast_grep,
			},
		})
	end,
}
