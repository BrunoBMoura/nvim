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

-- Local nvim-tree floating window ratios.
local HEIGHT_RATIO = 0.8
local WIDTH_RATIO = 0.8

require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    float = {
      enable = true,
      open_win_config = function()
        local screen_w = vim.opt.columns:get()
        local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
        local window_w = screen_w * WIDTH_RATIO
        local window_h = screen_h * HEIGHT_RATIO
        local window_w_int = math.floor(window_w)
        local window_h_int = math.floor(window_h)
        local center_x = (screen_w - window_w) / 2
        local center_y = ((vim.opt.lines:get() - window_h) / 2) - vim.opt.cmdheight:get()
        return {
          border = "rounded",
          relative = "editor",
          row = center_y,
          col = center_x,
          width = window_w_int,
          height = window_h_int,
        }
      end,
    }
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
