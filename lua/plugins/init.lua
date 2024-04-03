local plugins = {
  {
    lazy = true, "nvim-lua/plenary.nvim"
  },
  {
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
  },
  {
    "folke/tokyonight.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      vim.cmd([[colorscheme tokyonight]])
    end,
  },
  {
    "kyazdani42/nvim-tree.lua",
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
      vim.api.nvim_set_keymap("n", "<leader>e", ":NvimTreeToggle<CR>",   { noremap = true, silent = true })
      vim.api.nvim_set_keymap("n", "<leader>F", ":NvimTreeFindFile<CR>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("n", "<leader>R", ":NvimTreeRefresh<CR>",  { noremap = true, silent = true })
    end
  },
  {
    "kylechui/nvim-surround",
    config = function()
      require("nvim-surround").setup()
    end
  },
  { "b3nj5m1n/kommentary" },
  {
   "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({
        preview_config = {
          border = "rounded",
          row = 1,
          col = 0
        }
      })
    end
  },
  {
    "sindrets/diffview.nvim",
    config = function()
      require("diffview").setup({
        view = {
          merge_tool = {
            layout = "diff3_vertical",
            disable_diagnostics = true,
          }
        }
      })
    end
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = "Telescope",
    config = function()
      require("telescope").setup({
        defaults = {
          layout_config = { prompt_position = "bottom", },
          -- file_ignore_patterns = {},
        },
        pickers = {
          find_files = {
            previewer = false,
            results_title = false
          }
        },
      })
    end,
    keys = function()
      local default_opts = { noremap = true, silent = true }
      vim.keymap.set("n", "<leader>ff", function()
        require("telescope.builtin").find_files({
          no_ignore = true
        })
      end,
      default_opts)

      vim.keymap.set("n", "<leader>/", function()
        require("telescope.builtin").grep_string({
          -- Grep for the word under the cursor.
          search = vim.fn.input("Grep >")
        })
      end,
      default_opts)

      vim.keymap.set("n", "<leader>/", function()
        require("telescope.builtin").grep_string(
        -- Same as above, but searching selected text in visual mode.
          vim.fn.getline("'<", "'>")
        )
      end,
      default_opts)

      vim.api.nvim_set_keymap("n", "<leader>fb", ":Telescope buffers <CR>", default_opts)

      vim.api.nvim_set_keymap("n", "<leader>lg", ":Telescope live_grep <CR>", default_opts)
    end
  },
}

require("lazy").setup(plugins)
