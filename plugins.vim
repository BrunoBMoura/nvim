call plug#begin('~/.config/nvim/plugged')
    Plug 'preservim/nerdtree'
    Plug 'tpope/vim-fugitive'
    Plug 'mg979/vim-visual-multi'
    Plug 'apzelos/blamer.nvim'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'nvim-treesitter/nvim-treesitter-context',
    Plug 'numToStr/Comment.nvim'
    Plug 'airblade/vim-gitgutter'
    Plug 'ryanoasis/vim-devicons'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'Yggdroot/indentLine'
call plug#end()

let g:indentLine_char = '|'
let g:NERDTreeStatusline =" "
let g:NERDTreeWinSize = 38
let g:blamer_enabled = 1
let g:blamer_prefix = ' >> '

lua <<EOF
local ts_configs = require('nvim-treesitter.configs')
ts_configs.setup {
  ensure_installed =  {"c", "cpp", "lua", "rust", "python", "ruby", "vim"},
  highlight = {enable = true,},
  indent = {enable = false,}
}

cmnt_configs = require('Comment')
cmnt_configs.setup()

local ts_context = require('treesitter-context')
ts_context.setup {
    enable = true,
    max_lines = 0,
    trim_scope = 'outer',
    patterns = {
        default = {
            'class',
            'function',
            'method',
            'module',
        },
    },
    zindex = 20,
    mode = 'cursor',
}

EOF
