local ib_status, indent_blankline = pcall(require, "indent_blankline")
if not ib_status then
  return
end

indent_blankline.setup()

local na_status, nvim_autopairs = pcall(require, "nvim-autopairs")
if not na_status then
  return
end

nvim_autopairs.setup()

local ns_status, nvim_surround = pcall(require, "nvim-surround")
if not ns_status then
  return
end

nvim_surround.setup()

local gs_status, gitsigns = pcall(require, "gitsigns")
if not gs_status then
  return
end

gitsigns.setup({
  preview_config = {
    border = "rounded",
    row = 1,
    col = 0
  }
})

local dv_status, diffview = pcall(require, "diffview")
if not dv_status then
  return
end

diffview.setup({
  view = {
    merge_tool = {
      layout = "diff3_vertical",
      disable_diagnostics = true,
    }
  }
})

local ts_status, nvim_treesitter_configs = pcall(require, "nvim-treesitter.configs")
if not ts_status then
  return
end

nvim_treesitter_configs.setup({
  ensure_installed = {
    "c",
    "cpp",
    "lua",
    "rust",
    "python",
    "ruby",
    "comment"
  },
  highlight = {
    enable = true
  },
  indent = {
    enable = false
  }
})

require('telescope').setup({
  defaults = {
    layout_config = {
      prompt_position = "bottom",
    },
  },
  pickers = {
    find_files = {
      previewer = false,
      results_title = false
    }
  },
})

local tsctx_status, treesitter_context = pcall(require, "treesitter-context")
if not tsctx_status then
  return
end

treesitter_context.setup({
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

local nt_status, nvim_tree = pcall(require, "nvim-tree")
if not nt_status then
  return
end

-- Local nvim-tree floating window ratios.
local HEIGHT_RATIO = 0.8
local WIDTH_RATIO = 0.8

nvim_tree.setup({
  sort_by = "case_sensitive",
  view = {
    -- Set the positioning of nvim-tree floating window to be centered
    -- to the screens display.
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
    -- dotfiles = true
  },
  git = {
    ignore = false
  }
})
