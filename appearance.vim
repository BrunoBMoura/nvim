colorscheme napolitan

set background=dark
set list
set fillchars=stl:―,fold:۰,diff:·
set listchars=tab:»·,trail:·,eol:¬
set cursorline
set laststatus=3
set showtabline=3

fun! GitInfo()
    let info = FugitiveHead()
    if info != ''
        return info
    else
        return ''
    endif
endfun

fun! s:define_highlight(group_name, fg, bg, attr)
    exec "hi " . a:group_name . " ctermbg=" . a:bg . " ctermfg=" . a:fg. " cterm=" . a:attr
endfun

call s:define_highlight("_ORANGE_", g:napolitan_orange,  g:napolitan_background, "NONE")
call s:define_highlight("_PINK_",   g:napolitan_pink,    g:napolitan_background, "NONE")
call s:define_highlight("_CYAN_",   g:napolitan_cyan,    g:napolitan_background, "NONE")
call s:define_highlight("_GREY_",   g:napolitan_divisor, g:napolitan_background, "NONE")
call s:define_highlight("_PURPLE_", g:napolitan_purple,  g:napolitan_background, "NONE")
call s:define_highlight("_GREEN_",  g:napolitan_green,   g:napolitan_background, "NONE")
call s:define_highlight("_AQUA_",   g:napolitan_aqua,    g:napolitan_background, "NONE")

set statusline=
set statusline+=%#_ORANGE_#%{(mode()=='n')?\'[Normal]\':''}
set statusline+=%#_GREEN_#%{(mode()=='i')?\'[Insert]\':''}
set statusline+=%#_PINK_#%{(mode()=='v')?\'[Visual]\':''}
"set statusline+=%#_PINK_#%{(mode()=='V')?\'[Visual_Line]\':''}
set statusline+=%#_AQUA_#%{(mode()=='c')?\'[Command]\':''}
set statusline+=\%#_CYAN_#[%{WebDevIconsGetFileTypeSymbol()}\ %f]
set statusline+=\%#_GREY_#
set statusline+=%=
set statusline+=\%#_AQUA_#[%{GitInfo()}]
set statusline+=\%#_PINK_#\[%{&fileencoding?&fileencoding:&encoding}]
set statusline+=\%#_PURPLE_#\[%l\/%L,%c]

