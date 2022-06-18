hi clear
if exists("syntax_on")
    syntax reset
endif

let g:colors_name = "napolitan"

if !exists('g:napolitan_ui')
    let g:napolitan_ui = 0
endif

let s:background  = "234"
let s:divisor     = "235"
let s:grey        = "240"
let s:dark_grey   = "181"
let s:visual      = "236"
let s:aqua        = "079"
let s:green       = "144"
let s:blue        = "067"
let s:red         = "088"
let s:orange      = "173"
let s:purple      = "103"
let s:pink        = "168"
let s:yellow      = "215"
let s:cyan        = "152"
let s:black       = "233"
let s:white       = "230"

fun! s:define_highlight(group_name, fg, bg, attr)
    exec "hi " . a:group_name . " ctermbg=" . a:bg . " ctermfg=" . a:fg. " cterm=" . a:attr
endfun

fun! s:term_highlight(group, fg, bg, attr)
    exec "hi! " . a:group . " ctermbg=" . a:bg . " ctermfg=" . a:fg. " cterm=" . a:attr
endfun

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
        let s .= '[('
        let s .=  i + 1 . ''
        let s .= ')'
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

if g:napolitan_ui == 1

    call s:define_highlight("_ORANGE_", s:orange, s:background, "NONE")
    call s:define_highlight("_PINK_", s:pink, s:background, "NONE")
    call s:define_highlight("_CYAN_", s:cyan, s:background, "NONE")
    call s:define_highlight("_PURPLE_", s:purple, s:background, "NONE")
    call s:define_highlight("_YELLOW_", s:yellow, s:background, "NONE")
    call s:define_highlight("_GREY_", s:divisor, s:background, "NONE")
    call s:define_highlight("_BLUE_", s:blue, s:background, "NONE")
    call s:define_highlight("_GREEN_", s:aqua, s:background, "NONE")

    set statusline=
    set statusline+=%#_ORANGE_#%{(mode()=='n')?\'[NORMAL]\':''}
    set statusline+=%#_BLUE_#%{(mode()=='i')?\'[INSERT]\':''}
    set statusline+=%#_PURPLE_#%{(mode()=='v')?\'[VISUAL]\':''}
    set statusline+=%#_PURPLE_#%{(mode()=='V')?\'[VISUAL_LINE]\':''}
    set statusline+=%#_CYAN_#%{(mode()=='c')?\'[COMMAND]\':''}
    set statusline+=\%#_CYAN_#[%f]

    set statusline+=\%#_GREY_#
    set statusline+=%=
    set statusline+=\%#_GREEN_#[%{GitInfo()}]

    set statusline+=\%#_PINK_#\[%{&fileencoding?&fileencoding:&encoding}]
    set statusline+=\%#_BLUE_#\[%l\/%L,%c]
    set laststatus=3

    set tabline=%!CustomTabLine()
    set showtabline=2
    "set winbar=%f
endif

" UI colors
call s:term_highlight("Normal",     s:white,   "NONE", "NONE")
call s:term_highlight("Error",      s:red,     "NONE", "NONE")
call s:term_highlight("ErrorMsg",   s:red,     "NONE", "NONE")
call s:term_highlight("Search",     s:pink,    "NONE", "NONE")
call s:term_highlight("IncSearch",  s:pink,    "NONE", "reverse")
call s:term_highlight("DiffChange", s:orange,  "NONE", "reverse")
call s:term_highlight("DiffText",   s:orange,  "NONE", "NONE")
call s:term_highlight("SignColumn", s:orange,  "NONE", "NONE")
call s:term_highlight("SpellBad",   s:white,   "NONE", "undercurl")
call s:term_highlight("SpellCap",   s:white,   "NONE", "NONE")
call s:term_highlight("SpellRare",  s:red,     "NONE", "NONE")
call s:term_highlight("WildMenu",   s:black,   "NONE", "NONE")
call s:term_highlight("Pmenu",      s:white,   "NONE", "NONE")
call s:term_highlight("PmenuThumb", s:divisor, "NONE", "NONE")
call s:term_highlight("MatchParen", s:orange,  "NONE", "NONE")
call s:term_highlight("NonText",    s:grey,    "NONE", "NONE")

" Custom configurations
call s:term_highlight("StatusLine",   s:divisor, "NONE",    "NONE")
call s:term_highlight("CursorLineNr", s:orange,  "NONE",    "bold")
call s:term_highlight("CursorLine",   "NONE",    s:divisor, "NONE")
call s:term_highlight("TabLineSel",   s:orange,  "NONE",    "NONE")
call s:term_highlight("TabLineFill",  "NONE",    s:divisor, "NONE")
call s:term_highlight("Title",        s:white,   s:divisor, "NONE")
call s:term_highlight("VertSplit",    s:divisor, "NONE",    "NONE")
call s:term_highlight("StatusLine",   s:divisor, "NONE",    "NONE")
call s:term_highlight("StatusLineNc", s:divisor, "NONE",    "NONE")
call s:term_highlight("SpecialKey",   s:yellow,  "NONE",    "NONE")
call s:term_highlight("Visual",       "NONE",    s:visual,  "NONE")
call s:term_highlight("LineNr",       s:grey,    "NONE",    "NONE")
call s:term_highlight("MsgArea",      s:orange,  "NONE",    "NONE")

" Syntax colors
call s:term_highlight("StorageClass", s:green,     "NONE", "NONE")
call s:term_highlight("Keyword",      s:orange,    "NONE", "NONE")
call s:term_highlight("Comment",      s:grey,      "NONE", "NONE")
call s:term_highlight("Constant",     s:dark_grey, "NONE", "NONE")
call s:term_highlight("String",       s:cyan,      "NONE", "NONE")
call s:term_highlight("Number",       s:purple,    "NONE", "NONE")
call s:term_highlight("Float",        s:purple,    "NONE", "NONE")
call s:term_highlight("Character",    s:cyan,      "NONE", "NONE")
call s:term_highlight("Boolean",      s:purple,    "NONE", "NONE")
call s:term_highlight("Identifier",   s:dark_grey, "NONE", "NONE")
call s:term_highlight("Function",     s:green,     "NONE", "NONE")
call s:term_highlight("Statement",    s:pink,      "NONE", "NONE")
call s:term_highlight("Conditional",  s:pink,      "NONE", "NONE")
call s:term_highlight("Repeat",       s:pink,      "NONE", "NONE")
call s:term_highlight("Label",        s:dark_grey, "NONE", "NONE")
call s:term_highlight("Operator",     s:aqua,      "NONE", "NONE")
call s:term_highlight("Exception",    s:pink,      "NONE", "NONE")
call s:term_highlight("Type",         s:yellow,    "NONE", "NONE")
call s:term_highlight("Structure",    s:pink,      "NONE", "NONE")
call s:term_highlight("Typedef",      s:pink,      "NONE", "NONE")
call s:term_highlight("PreProc",      s:blue,      "NONE", "NONE")
call s:term_highlight("Include",      s:blue,      "NONE", "NONE")
call s:term_highlight("Define",       s:blue,      "NONE", "NONE")
call s:term_highlight("PreCondit",    s:yellow,    "NONE", "NONE")
call s:term_highlight("Macro",        s:purple,    "NONE", "NONE")

" Display related
call s:term_highlight("Special",        s:cyan,   "NONE", "NONE")
call s:term_highlight("SpecialChar",    s:purple, "NONE", "NONE")
call s:term_highlight("Tag",            s:yellow, "NONE", "NONE")
call s:term_highlight("Delimiter",      s:white,  "NONE", "NONE")
call s:term_highlight("SpecialComment", s:purple, "NONE", "NONE")
call s:term_highlight("Debug",          s:red,    "NONE", "NONE")
call s:term_highlight("Underlined",     s:red,    "NONE", "NONE")
call s:term_highlight("Ignore",         s:green,  "NONE", "NONE")
call s:term_highlight("Error",          s:red,    "NONE", "NONE")
call s:term_highlight("Todo",           s:red,    "NONE", "NONE")
call s:term_highlight("Conceal",        s:red,    "NONE", "NONE")
call s:term_highlight("Directory",      s:green,  "NONE", "NONE")
call s:term_highlight("FoldColumn",     s:yellow, "NONE", "NONE")
call s:term_highlight("ModeMsg",        s:white, "NONE", "NONE")
call s:term_highlight("MoreMsg",        s:white,  "NONE", "NONE")
call s:term_highlight("Question",       s:pink,   "NONE", "NONE")
call s:term_highlight("DiffAdd",        s:pink,   "NONE", "NONE")
call s:term_highlight("diffAdded",      s:red,    "NONE", "NONE")
call s:term_highlight("diffCommon",     s:green,  "NONE", "NONE")
call s:term_highlight("Folded",         s:green,  "NONE", "NONE")
call s:term_highlight("WarningMsg",     s:green,  "NONE", "NONE")

" Plugin related
call s:term_highlight("TreesitterContext",           s:white,  s:background, "NONE")
call s:term_highlight("TreesitterContextLineNumber", s:orange,  "NONE", "NONE")

" Custom highlighting
" Python
call s:term_highlight("pythonTSConstBuiltin",    s:purple, "NONE", "NONE")
call s:term_highlight("pythonTSFuncBuiltin",     s:green,  "NONE", "NONE")
call s:term_highlight("pythonTSKeywordOperator", s:pink,   "NONE", "NONE")


