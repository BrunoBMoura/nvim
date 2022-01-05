set background=dark
hi clear
if exists("syntax_on")
    syntax reset
endif

let g:colors_name = "caramel"

if !exists('g:caramel_statusline ')
    let g:caramel_statusline = 0
endif

let s:green       = "122"
let s:red         = "197"
let s:orange      = "203"
let s:orange2     = "173"
let s:sand        = "216"
let s:purple      = "105"
let s:pink        = "168"
let s:yellow      = "215"
let s:white       = "230"
let s:grey        = "250"
let s:black       = "234"
let s:blue        = "195"
let s:visual_grey = "240"
let s:identifier  = "181"

function! s:define_highlight(group_name, fg, bg, attr)
    exec "hi " . a:group_name . " ctermbg=" . a:bg . " ctermfg=" . a:fg. " cterm=" . a:attr
endfun

function! s:term_highlight(group, fg, bg, attr)
    exec "hi! " . a:group . " ctermbg=" . a:bg . " ctermfg=" . a:fg. " cterm=" . a:attr
endfun

if g:caramel_statusline == 1

    call s:define_highlight("_ORANGE_", s:orange, s:black, "NONE")
    call s:define_highlight("_PINK_", s:pink, s:black, "NONE")
    call s:define_highlight("_YELLOW_", s:yellow, s:black, "NONE")
    call s:define_highlight("_GREY_", s:grey, s:black, "NONE")
    call s:define_highlight("_BLUE_", s:blue, s:black, "NONE")
    call s:define_highlight("_GREEN_", s:green, s:black, "NONE")

    set statusline=
    set statusline+=%#_ORANGE_#%{(mode()=='n')?\'[NORMAL]\':''}
    set statusline+=%#_BLUE_#%{(mode()=='i')?\'[INSERT]\':''}
    set statusline+=%#_YELLOW_#%{(mode()=='v')?\'[VISUAL]\':''}
    set statusline+=%#_YELLOW_#%{(mode()=='V')?\'[VISUAL_LINE]\':''}
    set statusline+=%#_PINK_#%{(mode()=='c')?\'[COMMAND]\':''}
    set statusline+=\%#_GREY_#[%f]

    set statusline+=%=
    set statusline+=\%#_GREEN_#[%{GitInfo()}]
    set statusline+=\%#_ORANGE_#\[%{&fileencoding?&fileencoding:&encoding}]
    set statusline+=\[%l\/%L,%c]
    set laststatus=2
endif

" UI colors
call s:term_highlight("Normal", s:white, "NONE", "NONE")
call s:term_highlight("Error", s:red, "NONE", "NONE")
call s:term_highlight("ErrorMsg", s:red, "NONE", "NONE")
call s:term_highlight("Search", s:pink, "NONE", "NONE")
call s:term_highlight("IncSearch", s:pink, "NONE", "reverse")
call s:term_highlight("DiffChange", s:orange, "NONE", "reverse")
call s:term_highlight("DiffText", s:orange, "NONE", "bold")
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
call s:term_highlight("CursorLineNr", s:orange, "NONE", "NONE")
call s:term_highlight("CursorLine", "NONE", s:black, "NONE")
call s:term_highlight("TabLineSel", s:orange, "NONE", "NONE")
call s:term_highlight("TabLineFill", "NONE", "NONE", "NONE")
call s:term_highlight("Title", s:white, "NONE", "NONE")
call s:term_highlight("VertSplit", s:black, "NONE", "NONE")
call s:term_highlight("StatusLine", s:black, "NONE", "NONE")
call s:term_highlight("StatusLineNc", s:black, "NONE", "NONE")
call s:term_highlight("SpecialKey", s:yellow, "NONE", "NONE")
call s:term_highlight("Visual", "NONE", s:visual_grey, "NONE")
call s:term_highlight("LineNr", s:grey, "NONE", "NONE")

" Syntax colors
call s:term_highlight("StorageClass", s:green, "NONE", "NONE")
call s:term_highlight("Keyword", s:pink, "NONE", "NONE")
call s:term_highlight("Comment", s:grey, "NONE", "italic")
call s:term_highlight("Constant", s:identifier, "NONE", "NONE")
call s:term_highlight("String", s:yellow, "NONE", "NONE")
call s:term_highlight("Number", s:yellow, "NONE", "NONE")
call s:term_highlight("Float", s:yellow, "NONE", "NONE")
call s:term_highlight("Character", s:yellow, "NONE", "NONE")
call s:term_highlight("Boolean", s:purple, "NONE", "NONE")

call s:term_highlight("Identifier", s:identifier, "NONE", "NONE")
call s:term_highlight("Function", s:orange2, "NONE", "NONE")
call s:term_highlight("Statement", s:orange, "NONE", "NONE")
call s:term_highlight("Conditional", s:orange, "NONE", "NONE")
call s:term_highlight("Repeat", s:orange, "NONE", "NONE")
call s:term_highlight("Label", s:identifier, "NONE", "NONE")
call s:term_highlight("Operator", s:sand, "NONE", "NONE")
call s:term_highlight("Exception", s:orange, "NONE", "NONE")

call s:term_highlight("Type", s:orange, "NONE", "NONE")
call s:term_highlight("Structure", s:red, "NONE", "NONE")
call s:term_highlight("Typedef", s:red, "NONE", "NONE")

call s:term_highlight("PreProc", s:red, "NONE", "NONE")
call s:term_highlight("Include", s:red, "NONE", "NONE")
call s:term_highlight("Define", s:red, "NONE", "NONE")
call s:term_highlight("PreCondit", s:red, "NONE", "NONE")
call s:term_highlight("Macro", s:pink, "NONE", "NONE")

call s:term_highlight("Special", s:green, "NONE", "NONE")
call s:term_highlight("SpecialChar", s:purple, "NONE", "NONE")
call s:term_highlight("Tag", s:yellow, "NONE", "NONE")
call s:term_highlight("Delimiter", s:white, "NONE", "NONE")
call s:term_highlight("SpecialComment", s:red, "NONE", "NONE")
call s:term_highlight("Debug", s:red, "NONE", "NONE")
call s:term_highlight("Underlined", s:red, "NONE", "NONE")
call s:term_highlight("Ignore", s:green, "NONE", "NONE")
call s:term_highlight("Error", s:red, "NONE", "NONE")
call s:term_highlight("Todo", s:red, "NONE", "NONE")
call s:term_highlight("Conceal", s:red, "NONE", "NONE")

call s:term_highlight("Directory", s:blue, "NONE", "NONE")
call s:term_highlight("FoldColumn", s:yellow, "NONE", "NONE")
call s:term_highlight("ModeMsg", s:yellow, "NONE", "NONE")
call s:term_highlight("MoreMsg", s:white, "NONE", "NONE")
call s:term_highlight("Question", s:pink, "NONE", "NONE")
call s:term_highlight("DiffAdd", s:pink, "NONE", "NONE")
call s:term_highlight("diffAdded", s:red, "NONE", "NONE")
call s:term_highlight("diffCommon", s:green, "NONE", "NONE")
call s:term_highlight("Folded", s:green, "NONE", "NONE")
call s:term_highlight("WarningMsg", s:green, "NONE", "NONE")

" Python: {{{
" call s:define_highlight("_GREEN_", s:red, "NONE", "NONE")
" hi! link pythonBuiltin DiffAdd
" hi! link pythonBuiltinObj GruvboxOrange
" hi! link pythonBuiltinFunc GruvboxOrange
" hi! link pythonFunction GruvboxAqua
" hi! link pythonDecorator GruvboxRed
" hi! link pythonInclude GruvboxBlue
" hi! link pythonImport GruvboxBlue
" hi! link pythonRun GruvboxBlue
" hi! link pythonCoding GruvboxBlue
" hi! link pythonOperator GruvboxRed
" hi! link pythonException GruvboxRed
" hi! link pythonExceptions GruvboxPurple
" hi! link pythonBoolean GruvboxPurple
" hi! link pythonDot GruvboxFg3
" hi! link pythonConditional GruvboxRed
" hi! link pythonRepeat GruvboxRed
" hi! link pythonDottedName GruvboxGreenBold

" }}}

" highlight! link SpellLocal     SpellCap
" highlight! link DiffDelete     Comment
" highlight! link diffRemoved    Comment
" highlight! link PmenuSbar      _WHITE
" highlight! link PmenuSel       Visual
" highlight! link VisualNOS      Visual
" highlight! link rstEmphasis    SpellRare
" highlight! link diffChanged    DiffChange

