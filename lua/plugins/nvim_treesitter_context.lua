return {
  "nvim-treesitter/nvim-treesitter-context",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  config = function()
    require("treesitter-context").setup({
      enable = true,
      max_lines = 0,
      trim_scope = "outer",
      patterns = {
        default = {
          "class",
          "function",
          "method",
        },
      },
      zindex = 20,
      mode = "cursor"
    })
  end
}
