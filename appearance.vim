colorscheme napolitan

set background=dark
set list
set fillchars=stl:―,fold:۰,diff:·
set listchars=tab:»·,trail:·,eol:¬
set cursorline
set laststatus=3
set showtabline=0

fun! GitInfo()
    let git = fugitive#head()
    if git != ''
        return fugitive#head()
    else
        return ''
    endif
endfun

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

        let s .=  i + 1 . ''
        let s .= ':['
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
        let s .= ' ]'
    endfor
    let s .= '%#TabLineFill#%T'
    return s
endfun

fun! s:define_highlight(group_name, fg, bg, attr)
    exec "hi " . a:group_name . " ctermbg=" . a:bg . " ctermfg=" . a:fg. " cterm=" . a:attr
endfun

call s:define_highlight("_ORANGE_", g:napolitan_orange,  g:napolitan_background, "NONE")
call s:define_highlight("_PINK_",   g:napolitan_pink,    g:napolitan_background, "NONE")
call s:define_highlight("_CYAN_",   g:napolitan_cyan,    g:napolitan_background, "NONE")
call s:define_highlight("_GREY_",   g:napolitan_divisor, g:napolitan_background, "NONE")
call s:define_highlight("_BLUE_",   g:napolitan_blue,    g:napolitan_background, "NONE")
call s:define_highlight("_GREEN_",  g:napolitan_green,   g:napolitan_background, "NONE")
call s:define_highlight("_AQUA_",   g:napolitan_aqua,    g:napolitan_background, "NONE")

set statusline=
set statusline+=%#_ORANGE_#%{(mode()=='n')?\'[Normal]\':''}
set statusline+=%#_GREEN_#%{(mode()=='i')?\'[Insert]\':''}
set statusline+=%#_PINK_#%{(mode()=='v')?\'[Visual]\':''}
set statusline+=%#_PINK_#%{(mode()=='V')?\'[Visual_Line]\':''}
set statusline+=%#_AQUA_#%{(mode()=='c')?\'[Command]\':''}
set statusline+=\%#_CYAN_#[%{WebDevIconsGetFileTypeSymbol()}\ %f]
set statusline+=\%#_GREY_#
set statusline+=%=
set statusline+=\%#_AQUA_#[%{GitInfo()}]
set statusline+=\%#_PINK_#\[%{&fileencoding?&fileencoding:&encoding}]
set statusline+=\%#_BLUE_#\[%l\/%L,%c]

"set tabline=%!CustomTabLine()
