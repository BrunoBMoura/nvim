local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({
      'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path
    })
    vim.cmd [[packadd packer.nvim]]
    return true
  else
    return false
  end
end

local packet_bootstrap = ensure_packer()

return require("packer").startup(function(use)
  use "wbthomason/packer.nvim"
  use "nvim-treesitter/nvim-treesitter"
  use "nvim-treesitter/nvim-treesitter-context"
  use "nvim-lua/plenary.nvim"
  use "nvim-telescope/telescope.nvim"
  use "tpope/vim-fugitive"
  use "kylechui/nvim-surround"
  use 'b3nj5m1n/kommentary'
  use "sindrets/diffview.nvim"
  use "lewis6991/gitsigns.nvim"
  use "windwp/nvim-autopairs"
  use "kyazdani42/nvim-tree.lua"
  use "kyazdani42/nvim-web-devicons"
  use "neovim/nvim-lspconfig"
  use "williamboman/nvim-lsp-installer"
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/nvim-cmp"
  use "L3MON4D3/LuaSnip"
  use "lukas-reineke/indent-blankline.nvim"

  if packer_bootstrap then
    require("packer").sync()
  end
end)
