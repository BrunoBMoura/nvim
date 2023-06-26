local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
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
  use "wbthomason/packer.nvim"
  use "tpope/vim-fugitive"
  use "kylechui/nvim-surround"
  use 'b3nj5m1n/kommentary'
  use "windwp/nvim-autopairs"
  use "lukas-reineke/indent-blankline.nvim"
  use "sindrets/diffview.nvim"
  use "lewis6991/gitsigns.nvim"
  use "rebelot/kanagawa.nvim"
  use "github/copilot.vim"
  use {
    "nvim-treesitter/nvim-treesitter",
    "nvim-treesitter/nvim-treesitter-context"
  }
  use {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim"
  }
  use {
    "kyazdani42/nvim-tree.lua",
    "kyazdani42/nvim-web-devicons"
  }
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig"
  }
  use {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/nvim-cmp"
  }
  use "L3MON4D3/LuaSnip"

  if packer_bootstrap then
    require("packer").sync()
  end
end)
