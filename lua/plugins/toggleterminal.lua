return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		require("toggleterm").setup({
			hide_numbers = true,
			autochdir = true,
			auto_scroll = true,
		})

		vim.keymap.set({ "n", "v", "t" }, "<C-/>", "<cmd>ToggleTerm<cr>", { desc = "ToggleTerm", noremap = true })
		vim.keymap.set({ "n", "v", "t" }, "<C-t>", "<cmd>ToggleTerm<cr>", { desc = "ToggleTerm", noremap = true })
	end,
}
