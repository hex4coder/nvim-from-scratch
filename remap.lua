local map = vim.keymap.set

-- save file
map({'n','v'}, '<C-s>', '<cmd>wa<cr>', {})

-- for file explorer
map('n','<leader>e', '<cmd>Neotree toggle=true<cr>', {})


-- for lazy package manager
map('n', '<leader>l', '<cmd>Lazy<cr>', {})


-- for mason
map('n', '<leader>cm', '<cmd>Mason<cr>', {})


-- for sourcing current file
map('n', '<leader>x', '<cmd>%source<cr>', {})
