return {
  "nvim-treesitter/nvim-treesitter",
  build = "TSUpdate",
  lazy = false,
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = { "c", "lua", "vimdoc" },
      highlight = { enable = true, },
      indent = { enable = false, },
      ignore_install = { "help" },
    })
  end
}
