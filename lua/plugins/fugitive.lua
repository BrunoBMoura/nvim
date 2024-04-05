return {
  "tpope/vim-fugitive",
  lazy = false,
  cmd = "Git",
  keys = function()
    local default_opts = { noremap = true, silent = true }
    vim.api.nvim_set_keymap("n", "<leader>gb", ":Git blame<CR>", default_opts)
  end
}
