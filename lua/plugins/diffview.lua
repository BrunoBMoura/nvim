return {
  "sindrets/diffview.nvim",
  lazy = false,
  config = function()
    require("diffview").setup({
      view = {
        merge_tool = {
          layout = "diff3_vertical",
          disable_diagnostics = true,
        }
      }
    })
  end,
  keys = function()
    local default_opts = { noremap = true, silent = true }
    vim.api.nvim_set_keymap("n", "<leader>do", ":DiffviewOpen <CR>", default_opts)
    vim.api.nvim_set_keymap("n", "<leader>dh", ":DiffviewFileHistory <CR> :resize -4 <CR>", default_opts)
  end
}
