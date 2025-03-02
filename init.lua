require("config.lazy")

-- init configs
vim.cmd("set mouse=a")
vim.cmd("set clipboard=unnamedplus")
vim.opt.smarttab = true
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2

vim.cmd("set number")
vim.cmd("set relativenumber")

require("remap")
