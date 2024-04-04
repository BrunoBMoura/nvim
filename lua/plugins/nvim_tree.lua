return {
  "kyazdani42/nvim-tree.lua",
  dependencies = { "kyazdani42/nvim-web-devicons" },
  lazy = false,
  config = function()
    local HEIGHT_RATIO = 0.8
    local WIDTH_RATIO = 0.8
    require("nvim-tree").setup({
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
  end,
  keys = function()
    local default_opts = { noremap = true, silent = true }
    vim.api.nvim_set_keymap("n", "<leader>e", ":NvimTreeToggle<CR>",   default_opts)
    vim.api.nvim_set_keymap("n", "<leader>F", ":NvimTreeFindFile<CR>", default_opts)
    vim.api.nvim_set_keymap("n", "<leader>R", ":NvimTreeRefresh<CR>",  default_opts)
  end
}
