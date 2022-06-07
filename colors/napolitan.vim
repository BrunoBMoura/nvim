hi clear
if exists("syntax_on")
    syntax reset
endif

let g:colors_name = "napolitan"

if !exists('g:napolitan_ui')
    let g:napolitan_ui = 0
endif

let s:green       = "156"
let s:dark_green  = "084"
let s:blue        = "111"
let s:dark_blue   = "110"
let s:red         = "161"
let s:dark_red    = "089"
let s:orange      = "209"
let s:dark_orange = "202"
let s:purple      = "103"
let s:dark_purple = "098"
let s:pink        = "167"
let s:dark_pink   = "168"
let s:grey        = "240"
let s:dark_grey   = "181"
let s:yellow      = "228"
let s:dark_yellow = "221"
let s:cyan        = "152"
let s:dark_cyan   = "116"
let s:black       = "233"
let s:white       = "230"
let s:delimiter_white = "229"
let s:visual_grey = "236"

fun! s:define_highlight(group_name, fg, bg, attr)
    exec "hi " . a:group_name . " ctermbg=" . a:bg . " ctermfg=" . a:fg. " cterm=" . a:attr
endfun

fun! s:term_highlight(group, fg, bg, attr)
    exec "hi! " . a:group . " ctermbg=" . a:bg . " ctermfg=" . a:fg. " cterm=" . a:attr
endfun

fun! GitInfo()
    let git = fugitive#head()
    if git != ''
        return ' '.fugitive#head()
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

if g:napolitan_ui == 1

    call s:define_highlight("_ORANGE_", s:orange, s:black, "NONE")
    call s:define_highlight("_PINK_", s:dark_pink, s:black, "NONE")
    call s:define_highlight("_CYAN_", s:cyan, s:black, "NONE")
    call s:define_highlight("_PURPLE_", s:purple, s:black, "NONE")
    call s:define_highlight("_YELLOW_", s:yellow, s:black, "NONE")
    call s:define_highlight("_GREY_", s:grey, s:black, "NONE")
    call s:define_highlight("_BLUE_", s:blue, s:black, "NONE")
    call s:define_highlight("_GREEN_", s:green, s:black, "NONE")

    set statusline=
    set statusline+=%#_ORANGE_#%{(mode()=='n')?\'[NORMAL]\':''}
    set statusline+=%#_BLUE_#%{(mode()=='i')?\'[INSERT]\':''}
    set statusline+=%#_PURPLE_#%{(mode()=='v')?\'[VISUAL]\':''}
    set statusline+=%#_PURPLE_#%{(mode()=='V')?\'[VISUAL_LINE]\':''}
    set statusline+=%#_CYAN_#%{(mode()=='c')?\'[COMMAND]\':''}
    set statusline+=\%#_CYAN_#[%f]

    set statusline+=%=
    set statusline+=\%#_GREEN_#[%{GitInfo()}]

    set statusline+=\%#_PINK_#\[%{&fileencoding?&fileencoding:&encoding}]
    set statusline+=\%#_CYAN_#\[%l\/%L,%c]
    set laststatus=3

    set tabline=%!CustomTabLine()
    set showtabline=2
    "set winbar=%f
endif

" UI colors
call s:term_highlight("Normal", s:white, "NONE", "NONE")
call s:term_highlight("Error", s:red, "NONE", "NONE")
call s:term_highlight("ErrorMsg", s:red, "NONE", "NONE")
call s:term_highlight("Search", s:pink, "NONE", "NONE")
call s:term_highlight("IncSearch", s:pink, "NONE", "reverse")
call s:term_highlight("DiffChange", s:orange, "NONE", "reverse")
call s:term_highlight("DiffText", s:orange, "NONE", "NONE")
call s:term_highlight("SignColumn", s:orange, "NONE", "NONE")
call s:term_highlight("SpellBad", s:white, "NONE", "undercurl")
call s:term_highlight("SpellCap", s:white, "NONE", "NONE")
call s:term_highlight("SpellRare", s:red, "NONE", "NONE")
call s:term_highlight("WildMenu", s:grey, "NONE", "NONE")
call s:term_highlight("Pmenu", s:white, "NONE", "NONE")
call s:term_highlight("PmenuThumb", s:black, "NONE", "NONE")
call s:term_highlight("MatchParen", s:orange, "NONE", "NONE")
call s:term_highlight("NonText", s:grey, "NONE", "NONE")

" Custom configurations
call s:term_highlight("StatusLine", s:black, "NONE", "NONE")
call s:term_highlight("CursorLineNr", s:orange, "NONE", "bold")
call s:term_highlight("CursorLine", "NONE", s:black, "NONE")
call s:term_highlight("TabLineSel", s:orange, "NONE", "NONE")
call s:term_highlight("TabLineFill", "NONE", s:black, "NONE")
"call s:term_highlight("TabLine", s:black, "NONE", "NONE")
call s:term_highlight("Title", s:white, s:black, "NONE")
call s:term_highlight("VertSplit", s:black, "NONE", "NONE")
call s:term_highlight("StatusLine", s:black, "NONE", "NONE")
call s:term_highlight("StatusLineNc", s:black, "NONE", "NONE")
call s:term_highlight("SpecialKey", s:yellow, "NONE", "NONE")
call s:term_highlight("Visual", "NONE", s:visual_grey, "NONE")
call s:term_highlight("LineNr", s:grey, "NONE", "NONE")
call s:term_highlight("MsgArea", s:orange, "NONE", "NONE")

" Syntax colors
call s:term_highlight("StorageClass", s:dark_green, "NONE", "NONE")
call s:term_highlight("Keyword", s:dark_pink, "NONE", "NONE")
call s:term_highlight("Comment", s:grey, "NONE", "NONE")
call s:term_highlight("Constant", s:dark_grey, "NONE", "NONE")
call s:term_highlight("String", s:cyan, "NONE", "NONE")
call s:term_highlight("Number", s:purple, "NONE", "NONE")
call s:term_highlight("Float", s:purple, "NONE", "NONE")
call s:term_highlight("Character", s:cyan, "NONE", "NONE")
call s:term_highlight("Boolean", s:purple, "NONE", "NONE")

call s:term_highlight("Identifier", s:dark_grey, "NONE", "NONE")
call s:term_highlight("Function", s:green, "NONE", "NONE")
call s:term_highlight("Statement", s:dark_pink, "NONE", "NONE")
call s:term_highlight("Conditional", s:dark_pink, "NONE", "NONE")
call s:term_highlight("Repeat", s:dark_pink, "NONE", "NONE")
call s:term_highlight("Label", s:dark_grey, "NONE", "NONE")
call s:term_highlight("Operator", s:dark_cyan, "NONE", "NONE")
call s:term_highlight("Exception", s:dark_pink, "NONE", "NONE")

call s:term_highlight("Type", s:orange, "NONE", "NONE")
call s:term_highlight("Structure", s:pink, "NONE", "NONE")
call s:term_highlight("Typedef", s:pink, "NONE", "NONE")

call s:term_highlight("PreProc", s:blue, "NONE", "NONE")
call s:term_highlight("Include", s:blue, "NONE", "NONE")
call s:term_highlight("Define", s:blue, "NONE", "NONE")
call s:term_highlight("PreCondit", s:yellow, "NONE", "NONE")
call s:term_highlight("Macro", s:dark_blue, "NONE", "NONE")

call s:term_highlight("Special", s:dark_cyan, "NONE", "NONE")
call s:term_highlight("SpecialChar", s:purple, "NONE", "NONE")
call s:term_highlight("Tag", s:yellow, "NONE", "NONE")
call s:term_highlight("Delimiter", s:white, "NONE", "NONE")
call s:term_highlight("SpecialComment", s:dark_purple, "NONE", "NONE")
call s:term_highlight("Debug", s:red, "NONE", "NONE")
call s:term_highlight("Underlined", s:red, "NONE", "NONE")
call s:term_highlight("Ignore", s:dark_green, "NONE", "NONE")
call s:term_highlight("Error", s:red, "NONE", "NONE")
call s:term_highlight("Todo", s:red, "NONE", "NONE")
call s:term_highlight("Conceal", s:red, "NONE", "NONE")

call s:term_highlight("Directory", s:green, "NONE", "NONE")
call s:term_highlight("FoldColumn", s:yellow, "NONE", "NONE")
call s:term_highlight("ModeMsg", s:yellow, "NONE", "NONE")
call s:term_highlight("MoreMsg", s:white, "NONE", "NONE")
call s:term_highlight("Question", s:pink, "NONE", "NONE")
call s:term_highlight("DiffAdd", s:pink, "NONE", "NONE")
call s:term_highlight("diffAdded", s:red, "NONE", "NONE")
call s:term_highlight("diffCommon", s:dark_green, "NONE", "NONE")
call s:term_highlight("Folded", s:dark_green, "NONE", "NONE")
call s:term_highlight("WarningMsg", s:dark_green, "NONE", "NONE")

" Custom highlighting
" Python
call s:term_highlight("pythonTSConstBuiltin", s:purple, "NONE", "NONE")
call s:term_highlight("pythonTSFuncBuiltin", s:green, "NONE", "NONE")
call s:term_highlight("pythonTSKeywordOperator", s:dark_pink, "NONE", "NONE")

"call s:term_highlight("rubyFunction", s:dark_red, "NONE", "NONE")

