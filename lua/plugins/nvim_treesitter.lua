return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  lazy = false,
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = USER.treesitter.parsers,
      highlight = { enable = true, },
      indent = { enable = false, },
      ignore_install = { "help" },
    })
  end
}
