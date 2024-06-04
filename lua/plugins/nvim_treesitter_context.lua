return {
  "nvim-treesitter/nvim-treesitter-context",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  config = function()
    require("treesitter-context").setup({
      enable = true,
      max_lines = 1,
      multiline_threshold = 1,
      trim_scope = "inner",
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
