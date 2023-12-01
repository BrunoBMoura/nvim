local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    local _ = fn.system({
      'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path
    })
    print("Installing Packer, please close and reopen Neovim.")
    vim.cmd [[packadd packer.nvim]]
    return true
  else
    return false
  end
end

local packer_bootstrap = ensure_packer()

return require("packer").startup(function(use)
  -- Packer package manager.
  use "wbthomason/packer.nvim"
  -- General quality of life.
  use {
    -- Automatic pairs.
    "windwp/nvim-autopairs",
    -- Better automatic surrounding.
    "kylechui/nvim-surround",
    -- Better commenting written in lua.
    "b3nj5m1n/kommentary",
    -- Copilot client.
    "github/copilot.vim"
  }
  -- Git stuff and diff display.
  use {
    "tpope/vim-fugitive",
    "sindrets/diffview.nvim",
    "lewis6991/gitsigns.nvim"
  }
  -- Colorschemes.
  use {
    "rebelot/kanagawa.nvim",
    "marko-cerovac/material.nvim",
  }
  -- Treesitter.
  use {
    "nvim-treesitter/nvim-treesitter",
    "nvim-treesitter/nvim-treesitter-context"
  }
  -- Fuzzy finder and displayer.
  use {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim"
  }
  -- File explorer.
  use {
    "kyazdani42/nvim-tree.lua",
    "kyazdani42/nvim-web-devicons"
  }
  -- Simple LSP configuration.
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig"
  }
  -- Completion and snip engine.
  use {
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "L3MON4D3/LuaSnip"
  }

  if packer_bootstrap then
    require("packer").sync()
  end
end)
