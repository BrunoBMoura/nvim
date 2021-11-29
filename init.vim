"
" OVERALL FUNCTIONALITY
"

set path+=**
filetype plugin on
syntax on

set t_Co=256
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set autoindent

set number
set relativenumber
set nohlsearch
set hidden
set noerrorbells
set nowrap

set nobackup
set undodir=~/.config/nvim/undodir
set undofile
set incsearch
set scrolloff=12
set encoding=utf-8
set wildmenu
set wildmode=list:longest
set autoread

colorscheme miguekai
"
" OVERALL APPEARANCE (status bar, etc)
"

set list
set fillchars=fold:۰,diff:·
set listchars=tab:»·,trail:·,eol:¬
set cursorline
set tabline=%!CustomTabLine()
set showtabline=2

hi _GREEN_   term=bold cterm=bold ctermbg=233 ctermfg=82
hi _ORANGE_  term=bold cterm=bold ctermbg=233 ctermfg=202
hi _BLUE_    term=bold cterm=bold ctermbg=233 ctermfg=45
hi _YELLOW_  term=bold cterm=bold ctermbg=233 ctermfg=214
hi _GREY_    term=bold cterm=bold ctermbg=233 ctermfg=246

set statusline=
set statusline+=%#_ORANGE_#%{(mode()=='n')?\ '[NORMAL]\':''}
set statusline+=%#_BLUE_#%{(mode()=='i')?\'[INSERT]\':''}
set statusline+=%#_YELLOW_#%{(mode()=='v')?\'[VISUAL]\':''}
set statusline+=%#_YELLOW_#%{(mode()=='V')?\'[VISUAL_LINE]\':''}
set statusline+=%#_GREEN_#%{(mode()=='c')?\'[COMMAND]\':''}
set statusline+=\%#_GREY_#[%f]

set statusline+=%=
set statusline+=\%#_GREEN_#[%{GitInfo()}]
set statusline+=\%#_ORANGE_#\[%{&fileencoding?&fileencoding:&encoding}]
set statusline+=\[%l\/%L,%c]
set laststatus=2

"
" UTILS FUNCTIONS AND GROUPS
"
"
fun! CustomTabLine()
    let s = ''
    for i in range(tabpagenr('$'))
        if i + 1 == tabpagenr()
            let s .= '%#TabLineSel#'
        else
            let s .= '%#TabLine#'
        endif
        if i + 1 == tabpagenr()
            let s .= '%#TabLineSel#' " WildMenu
        else
            let s .= '%#Title#'
        endif
        let s .= '['
        let s .=  i + 1 . ''
        let s .= ']'
        let n = ''  " temp str for buf names
        let m = 0   " &modified counter
        let buflist = tabpagebuflist(i + 1)
        for b in buflist
            if getbufvar(b, "&buftype") == 'help'
            elseif getbufvar(b, "&buftype") == 'quickfix'
            elseif getbufvar(b, "&modifiable")
                let n .= fnamemodify(bufname(b), ':t') . ', '
            endif
            if getbufvar(b, "&modified")
                let m += 1
            endif
        endfor
        let n = substitute(n, ', $', '', '')
        if m > 0
            let s .= '+'
        endif
        let s .=" "
        if n == ''
            let s.= '[New]'
        else
            let s .= n
        endif
        let s .= ' '
    endfor
    let s .= '%#TabLineFill#%T'
    return s
endfun

function! GitInfo()
    let git = fugitive#head()
    if git != ''
        return ' '.fugitive#head()
    else
        return ''
endfun

" Removes white spaces whenever saving files
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

" Replaces selected lines on visual mode
fun! StonksReplace()
    let [lnum1, col1] = getpos("'<")[1:2]
    let [lnum2, col2] = getpos("'>")[1:2]
    let lines = getline(lnum1, lnum2)
    let lines[-1] = lines[-1][: col2 - (&selection == 'inclusive' ? 1 : 2)]
    let lines[0] = lines[0][col1 - 1:]
    let selection = join(lines, '\n')
    let change = input("Text to replace the selection with:")
    execute ":%s/".selection."/".change."/g"
endfun

augroup BRUNO_POWER
    autocmd!
    " Always before saving the file remove unnecessary white spaces
    autocmd BufWritePre * :call TrimWhitespace()
    " Start NERDTree and leave the cursor in it.
    autocmd VimEnter * NERDTree
    " Open the existing NERDTree on each new tab
    autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif
    " Close the tab if NERDTree is the only window remaining in it.
    autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
augroup END

"
" PLUGINS AND CONFIGURATIONS
"
call plug#begin('~/.config/nvim/plugged')
    Plug 'preservim/nerdtree'                                   " File explorer
    Plug 'chun-yang/auto-pairs'                                 " Create auto parenthesis an other symbols pairs
    Plug 'tpope/vim-fugitive'                                   " Git integration inside vim
    Plug 'mg979/vim-visual-multi'                               " Multiple cursors editing
    Plug 'apzelos/blamer.nvim'                                  " VS-code like blaming on lines"
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " Better syntax highlighting"
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'numToStr/Comment.nvim'
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

"
" REMAPS
"
nnoremap <SPACE> <Nop>
let mapleader=" "

:vnoremap ; :call StonksReplace()<CR>
:nnoremap <F1> :tabp<CR>
:nnoremap <F2> :tabn<CR>
:nnoremap <leader>T :sp<bar>term<CR><C-w>J:resize10<CR>
:nnoremap <leader>t :NERDTreeToggle<CR>
:nnoremap <leader>rw cw<C-r>0<C-c>
:nnoremap <leader>w <C-s> :w<CR>
" Resizing windows
:nnoremap <leader>j :resize +2 <CR>
:nnoremap <leader>k :resize -2 <CR>
:nnoremap <leader>h :vertical resize +2 <CR>
:nnoremap <leader>l :vertical resize -2 <CR>
" Move selection during visual line mode
:vnoremap J :m '>+1'<CR>gv=gv
:vnoremap K :m '<-2'<CR>gv=gv
" Better identing in visual mode
:vnoremap <Tab> >gv
:vnoremap <S-Tab> <gv
" Find file or text
:nnoremap <leader>ff :Files <CR>
:nnoremap <leader>ft :Ag <CR>
" Commenting
" :vnoremap <leader>c gc
" :vnoremap <leader>b gb
" :nnoremap <leader>c gcc
