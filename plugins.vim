call plug#begin('~/.config/nvim/plugged')
    Plug 'preservim/nerdtree'                                   " File explorer
    Plug 'tpope/vim-fugitive'                                   " Git integration inside vim
    Plug 'mg979/vim-visual-multi'                               " Multiple cursors editing
    Plug 'apzelos/blamer.nvim'                                  " VS-code like blaming on lines"
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " Better syntax highlighting"
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }         " Fuzzy finder shenanigans
    Plug 'junegunn/fzf.vim'
    Plug 'numToStr/Comment.nvim'                                " Better commenting throughout code
call plug#end()

let g:NERDTreeStatusline =" "
let g:NERDTreeWinSize = 38      " Configure the size of the NERDTree tab
let g:blamer_enabled = 1
let g:blamer_prefix = ' >> '

lua <<EOF
require'nvim-treesitter.configs'.setup {
ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
ignore_install = { "javascript" }, -- List of parsers to ignore installing
highlight = {
    enable = true,                 -- false will disable the whole extension
    disable = {},                  -- list of language that will be disabled
    },
}
require('Comment').setup()
EOF
