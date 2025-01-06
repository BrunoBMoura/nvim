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
            local width = math.floor(vim.o.columns * WIDTH_RATIO)
            local height =  math.floor(vim.o.lines * HEIGHT_RATIO)
            local col = math.floor((vim.o.columns - width) / 2)
            local row = math.floor((vim.o.lines - height) / 2)
            return {
              relative = "editor",
              style = "minimal",
              border = "rounded",
              row = row,
              col = col,
              width = width,
              height = height,
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
