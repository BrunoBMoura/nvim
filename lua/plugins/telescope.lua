return {
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
    -- Default file fuzzy finder .
    vim.keymap.set("n", "<leader>ff", function()
      require("telescope.builtin").find_files({
        no_ignore = true
      })
    end, default_opts)
    -- Grep for the word under the cursor.
    vim.keymap.set("n", "<leader>/", function()
      require("telescope.builtin").grep_string({
        search = vim.fn.input("Grep >")
      })
    end, default_opts)
    -- Same as above, but searching selected text in visual mode.
    vim.keymap.set("n", "<leader>/", function()
      require("telescope.builtin").grep_string(
        vim.fn.getline("'<", "'>")
      )
    end, default_opts)
    -- Buffer searching.
    vim.api.nvim_set_keymap("n", "<leader>fb", ":Telescope buffers <CR>", default_opts)
    -- Default live grep.
    vim.api.nvim_set_keymap("n", "<leader>lg", ":Telescope live_grep <CR>", default_opts)
  end
}
