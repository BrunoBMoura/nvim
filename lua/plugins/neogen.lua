return {
  "danymat/neogen",
  config = function()
    require("neogen").setup({ snippet_engine = "luasnip" })
  end,
  keys = function()
    local default_opts = { noremap = true, silent = true }
    vim.keymap.set("n", "<leader>dg", function()
      require("neogen").generate()
    end, default_opts)
  end
}
