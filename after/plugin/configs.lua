require("nvim-autopairs").setup()
require("gitsigns").setup()

vim.api.nvim_set_var('indentLine_char', '⎸')

require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "c", "cpp", "lua", "rust", "python", "ruby", "vim", "comment"
  },
  highlight = {enable = true,},
  indent = {enable = false,}
})

require("treesitter-context").setup({
  enable = true,
  max_lines = 0,
  trim_scope = "outer",
  patterns = {
    default = {
      "class",
      "function",
      "method",
      "module",
    },
  },
  zindex = 20,
  mode = "cursor",
})

require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        {
          key = "u",
          action = "dir_up"
        },
      },
    },
  },
  renderer = {
    add_trailing = true,
    group_empty = true,
    indent_markers = {
      enable = true,
    }
  },
  filters = {
    dotfiles = true,
  },
})
