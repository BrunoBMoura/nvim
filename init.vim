filetype plugin on
syntax on
set path+=**
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

" Sourcing auxiliar configuration files
execute 'source $HOME/.config/nvim/appearance.vim'
execute 'source $HOME/.config/nvim/plugins.vim'

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

" Surrounds text (from vim fandom)
fun! StonksSurround(s1, s2) range
  exe "normal vgvmboma\<Esc>"
  normal `a
  let lineA = line(".")
  let columnA = col(".")
  normal `b
  let lineB = line(".")
  let columnB = col(".")
  if lineA > lineB || lineA <= lineB && columnA > columnB
    normal mc
    normal `amb
    normal `cma
  endif
  exe "normal `ba" . a:s2 . "\<Esc>`ai" . a:s1 . "\<Esc>"
endfun

" Shows current function name
fun! StonksFuncName()
  echohl ModeMsg
  echo getline(search("^[^ \t#/]\\{2}.*[^:]\s*$", 'bWn'))
  echohl None
endfun

function! SynStack()
    let l:s = synID(line('.'), col('.'), 1)
    echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfun

augroup BRUNO_POWER
    autocmd!
    " Always before saving the file remove unnecessary white spaces
    autocmd BufWritePre * :call TrimWhitespace()
    " Open the existing NERDTree on each new tab
    autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif
    " Close the tab if NERDTree is the only window remaining in it.
    autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
augroup END

nnoremap <SPACE> <Nop>
vnoremap <SPACE> <Nop>
let mapleader=" "

:vnoremap ; :call StonksReplace()<CR>
:nnoremap <F1> :tabp<CR>
:nnoremap <F2> :tabn<CR>
:nnoremap <leader>T :sp<bar>term<CR><C-w>J :resize20<CR>i
:nnoremap <leader>t :NERDTreeToggle<CR>
:nnoremap <leader>F :NERDTreeFind<CR>
:nnoremap <leader>rw cw<C-r>0<C-c>
:nnoremap <leader>w <C-s> :w<CR>
:nnoremap <leader>q <C-s> :q<CR>
:nnoremap <leader Q <C-s> :q!<CR>
" Resizing window
:nnoremap <leader>j :resize +2 <CR>
:nnoremap <leader>k :resize -2 <CR>
:nnoremap <leader>h :vertical resize +2 <CR>
:nnoremap <leader>l :vertical resize -2 <CR>
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
" Move selection during visual line mode
:vnoremap J :m '>+1'<CR>gv=gv
:vnoremap K :m '<-2'<CR>gv=gv
" Surrounding on visual mode
:vnoremap <leader>( :call StonksSurround('(', ')')<CR>
:vnoremap <leader>[ :call StonksSurround('[', ']')<CR>
:vnoremap <leader>{ :call StonksSurround('{', '}')<CR>
:nnoremap <F9> :call StonksFuncName() <CR>

:nmap <leader>W :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
