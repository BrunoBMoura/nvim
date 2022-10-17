require("Comment").setup()
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

-- Used for floating mode
-- local width = 50
-- local height = 30
-- local gwidth = vim.api.nvim_list_uis()[1].width
-- local gheight = vim.api.nvim_list_uis()[1].height

require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        {key = "u", action = "dir_up"},
      },
    },
    -- float = {
    --   enable = true,
    --   open_win_config = {
    --     relative = "editor",
    --     width = width,
    --     height = height
    --     row = (gheight - height) * 0.4,
    --     col = (gwidth - width) * 0.5
    --   }
    -- }
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
