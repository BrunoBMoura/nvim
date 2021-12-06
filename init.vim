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

source appearance.vim
source plugins.vim

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

nnoremap <SPACE> <Nop>
let mapleader=" "

:vnoremap ; :call StonksReplace()<CR>
:nnoremap <F1> :tabp<CR>
:nnoremap <F2> :tabn<CR>
:nnoremap <leader>T :sp<bar>term<CR><C-w>J :resize20<CR>i
:nnoremap <leader>t :NERDTreeToggle<CR>
:nnoremap <leader>rw cw<C-r>0<C-c>
:nnoremap <leader>w <C-s> :w<CR>
:nnoremap <leader>q <C-s> :q<CR>
:nnoremap <leader>Q <C-s> :q!<CR>
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
:nnoremap <leader>fg :GFiles <CR>
" Git related
:nnoremap <leader>gb :Git blame <CR>
:nnoremap <leader>gs :Git status <CR>
