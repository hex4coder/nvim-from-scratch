return {

  "APZelos/blamer.nvim",

  config = function()
    vim.keymap.set("n", "<leader>gl", "<cmd>BlamerToggle<cr>")
    vim.g.blamer_enabled = true
    vim.g.blamer_delay = 1000
  end,
}
