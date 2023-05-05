require("nvim-autopairs").setup()
require("nvim-surround").setup()
require("gitsigns").setup()
require("indent_blankline").setup()

require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "c", "cpp", "lua", "rust", "python", "ruby", "vim", "comment"
  },
  highlight = {
    enable = true
  },
  indent = {
    enable = false
  }
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
  mode = "cursor"
})

require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    side = "right"
  },
  renderer = {
    add_trailing = true,
    group_empty = true,
    indent_markers = {
      enable = true,
    }
  },
  filters = {
    dotfiles = true
  }
})

require("diffview").setup({
  view = {
    merge_tool = {
      layout = "diff3_vertical",
      disable_diagnostics = true,
    }
  }
})
