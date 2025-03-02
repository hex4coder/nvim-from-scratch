local map = vim.keymap.set
local opts = {
  silent = true,
  noremap = true,
}

-- save file
map({ "n", "v" }, "<C-s>", function()
  vim.cmd("wa")
  vim.cmd("lua vim.lsp.buf.format()")
end, opts)

-- for moving window
map({ "n", "v" }, "<C-h>", "<C-w>h", opts)
map({ "n", "v" }, "<C-j>", "<C-w>j", opts)
map({ "n", "v" }, "<C-k>", "<C-w>k", opts)
map({ "n", "v" }, "<C-l>", "<C-w>l", opts)

-- for file explorer
map("n", "<leader>e", "<cmd>Neotree toggle=true<cr>", opts)

-- for lazy package manager
map("n", "<leader>l", "<cmd>Lazy<cr>", opts)

-- for mason
map("n", "<leader>cm", "<cmd>Mason<cr>", opts)

-- for sourcing current file
map("n", "<leader>x", "<cmd>%source<cr>", opts)

-- for splitting window
map({ "n", "v" }, "<M-v>", "<cmd>vsplit<cr>", opts)
map({ "n", "v" }, "<M-h>", "<cmd>split<cr>", opts)

-- terminal window
map({ "n", "v" }, "<M-H>", "<cmd>split term://zsh<cr>", opts)
map({ "n", "v" }, "<M-V>", "<cmd>vsplit term://zsh<cr>", opts)

-- exit from terminal to normal mode
map("t", "<Esc>", "<C-\\><C-n>", opts)
