vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function()
  use "wbthomason/packer.nvim"
  use "folke/tokyonight.nvim"
  use "morhetz/gruvbox"
  use "nvim-treesitter/nvim-treesitter"
  use "nvim-treesitter/nvim-treesitter-context"
  use "nvim-lua/plenary.nvim"
  use "nvim-telescope/telescope.nvim"
  use "preservim/nerdtree"
  use "tpope/vim-fugitive"
  use "numToStr/Comment.nvim"
  use "Yggdroot/indentLine"
  use "airblade/vim-gitgutter"
  use "ryanoasis/vim-devicons"
    --
  use "neovim/nvim-lspconfig"
  use "williamboman/nvim-lsp-installer"
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/nvim-cmp"
  use "L3MON4D3/LuaSnip"
end)
