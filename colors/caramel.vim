set background=dark
highlight clear
syntax reset

let g:colors_name = "caramel"
let g:caramel_statusline = 1

let s:green       = "122"
let s:red         = "197"
let s:orange      = "203"
let s:blue        = "45"
let s:purple      = "105"
let s:pink        = "168"
let s:yellow      = "215"
let s:white       = "230"
let s:grey        = "250"
let s:black       = "234"
let s:light_blue  = "195"
let s:visual_grey = "240"
let s:identifier  = "181"

if g:caramel_statusline == 1
    let g:orange      = "203"
    let g:pink        = "168"
    let g:yellow      = "215"
    let g:grey        = "250"
    let g:black       = "234"
    let g:light_blue  = "195"
endif

function! s:term_highlight(group, fg, bg, attr)
    exec "hi " . a:group . " ctermbg=" . a:bg . " ctermfg=" . a:fg. " cterm=" . a:attr
endfun

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
call s:term_highlight("Keyword", s:orange, "NONE", "NONE")
call s:term_highlight("Comment", s:grey, "NONE", "italic")
call s:term_highlight("Constant", s:identifier, "NONE", "NONE")
call s:term_highlight("String", s:yellow, "NONE", "NONE")
call s:term_highlight("Number", s:yellow, "NONE", "NONE")
call s:term_highlight("Float", s:yellow, "NONE", "NONE")
call s:term_highlight("Character", s:yellow, "NONE", "NONE")
call s:term_highlight("Boolean", s:purple, "NONE", "NONE")

call s:term_highlight("Identifier", s:identifier, "NONE", "NONE")
call s:term_highlight("Function", s:light_blue, "NONE", "NONE")
call s:term_highlight("Statement", s:orange, "NONE", "NONE")
call s:term_highlight("Conditional", s:orange, "NONE", "NONE")
call s:term_highlight("Repeat", s:orange, "NONE", "NONE")
call s:term_highlight("Label", s:identifier, "NONE", "NONE")
call s:term_highlight("Operator", s:orange, "NONE", "NONE")
call s:term_highlight("Keyword", s:orange, "NONE", "NONE")
call s:term_highlight("Exception", s:pink, "NONE", "NONE")

call s:term_highlight("PreProc", s:red, "NONE", "NONE")
call s:term_highlight("Include", s:red, "NONE", "NONE")
call s:term_highlight("Define", s:red, "NONE", "NONE")
call s:term_highlight("PreCondit", s:red, "NONE", "NONE")
call s:term_highlight("Macro", s:pink, "NONE", "NONE")

call s:term_highlight("Type", s:orange, "NONE", "NONE")
call s:term_highlight("StorageClass", s:green, "NONE", "NONE")
call s:term_highlight("Structure", s:red, "NONE", "NONE")
call s:term_highlight("Typedef", s:red, "NONE", "NONE")

call s:term_highlight("Special", s:white, "NONE", "NONE")
call s:term_highlight("SpecialChar", s:white, "NONE", "NONE")
call s:term_highlight("Tag", s:yellow, "NONE", "NONE")
call s:term_highlight("Delimiter", s:white, "NONE", "NONE")
call s:term_highlight("SpecialComment", s:red, "NONE", "NONE")
call s:term_highlight("Debug", s:red, "NONE", "NONE")
call s:term_highlight("Underlined", s:red, "NONE", "NONE")
call s:term_highlight("Ignore", s:green, "NONE", "NONE")
call s:term_highlight("Error", s:red, "NONE", "NONE")
call s:term_highlight("Todo", s:red, "NONE", "NONE")

call s:term_highlight("Directory", s:light_blue, "NONE", "NONE")
call s:term_highlight("FoldColumn", s:yellow, "NONE", "NONE")
call s:term_highlight("ModeMsg", s:yellow, "NONE", "NONE")
call s:term_highlight("MoreMsg", s:white, "NONE", "NONE")
call s:term_highlight("Question", s:pink, "NONE", "NONE")
call s:term_highlight("DiffAdd", s:pink, "NONE", "NONE")
call s:term_highlight("diffAdded", s:red, "NONE", "NONE")
call s:term_highlight("diffCommon", s:green, "NONE", "NONE")
call s:term_highlight("Folded", s:green, "NONE", "NONE")
call s:term_highlight("WarningMsg", s:green, "NONE", "NONE")

" highlight! link iCursor        SpecialKey
" highlight! link SpellLocal     SpellCap
" highlight! link DiffDelete     Comment
" highlight! link diffRemoved    Comment
" highlight! link PmenuSbar      _WHITE
" highlight! link PmenuSel       Visual
" highlight! link VisualNOS      Visual
" highlight! link Cursor         StatusLine
" highlight! link rstEmphasis    SpellRare
" highlight! link diffChanged    DiffChange
