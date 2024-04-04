return {
   "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({
        preview_config = {
          border = "rounded",
          row = 1,
          col = 0
        }
      })
    end
}
