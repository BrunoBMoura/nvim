colorscheme miguekai

hi _PINK_  cterm=NONE ctermbg=233 ctermfg=168
hi _ORANGE_ cterm=NONE ctermbg=233 ctermfg=202
hi _BLUE_   cterm=NONE ctermbg=233 ctermfg=45
hi _YELLOW_ cterm=NONE ctermbg=233 ctermfg=214
hi _GREY_   cterm=NONE ctermbg=233 ctermfg=246

set statusline=
set statusline+=%#_ORANGE_#%{(mode()=='n')?\ '[NORMAL]\':''}
set statusline+=%#_BLUE_#%{(mode()=='i')?\'[INSERT]\':''}
set statusline+=%#_YELLOW_#%{(mode()=='v')?\'[VISUAL]\':''}
set statusline+=%#_YELLOW_#%{(mode()=='V')?\'[VISUAL_LINE]\':''}
set statusline+=%#_PINK_#%{(mode()=='c')?\'[COMMAND]\':''}
set statusline+=\%#_GREY_#[%f]

set statusline+=%=
set statusline+=\%#_PINK_#[%{GitInfo()}]
set statusline+=\%#_ORANGE_#\[%{&fileencoding?&fileencoding:&encoding}]
set statusline+=\[%l\/%L,%c]
set laststatus=2

set list
set fillchars=fold:۰,diff:·
set listchars=tab:»·,trail:·,eol:¬
set cursorline
set tabline=%!CustomTabLine()
set showtabline=2

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

fun! GitInfo()
    let git = fugitive#head()
    if git != ''
        return ' '.fugitive#head()
    else
        return ''
endfun

