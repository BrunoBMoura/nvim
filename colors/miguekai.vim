set background=dark
highlight clear
syntax reset

let g:colors_name = "miguekai"

let s:green =  "122"
let s:red =    "197"
let s:orange = "203"
let s:blue =   "45"
let s:purple = "99"
let s:pink =   "168"
let s:yellow = "179"
let s:white =  "230"
let s:grey =   "250"
let s:black =  "234"

let s:light_blue = "159"
let s:visual_grey = "240"
let s:identifier = "181"

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
call s:term_highlight("SpecialKey", s:black, "NONE", "NONE")
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
call s:term_highlight("Delimiter", s:identifier, "NONE", "NONE")
call s:term_highlight("SpecialComment", s:red, "NONE", "NONE")
call s:term_highlight("Debug", s:red, "NONE", "NONE")
call s:term_highlight("Underlined", s:red, "NONE", "NONE")
call s:term_highlight("Ignore", s:green, "NONE", "NONE")
call s:term_highlight("Error", s:red, "NONE", "NONE")
call s:term_highlight("Todo", s:red, "NONE", "NONE")


" highlight! link Boolean        _PURPLE
" highlight! link Delimiter      _WHITE
" highlight! link Identifier     _WHITE
" highlight! link Title          Normal
" highlight! link Debug          Normal
" highlight! link Exception      Normal
" highlight! link FoldColumn     Normal
" highlight! link Macro          _PURPLE
" highlight! link ModeMsg        Normal
" highlight! link MoreMsg        Normal
" highlight! link Question       _PURPLE
" highlight! link Conditional    _ORANGE
" highlight! link Statement      _ORANGE
" highlight! link Operator       _ORANGE
" highlight! link Structure      _ORANGE
" highlight! link Function       _LIGHT_BLUE
" highlight! link Include        _RED
" highlight! link Type           _ORANGE
" highlight! link Typedef        _ORANGE
" highlight! link Todo           Keyword
" highlight! link Label          _ORANGE
" highlight! link Define         Keyword
" highlight! link DiffAdd        _ORANGE
" highlight! link diffAdded      Keyword
" highlight! link diffCommon     Keyword
" highlight! link Directory      Keyword
" highlight! link PreCondit      Keyword
" highlight! link PreProc        Keyword
" highlight! link Repeat         _ORANGE
" highlight! link Special        _ORANGE
" highlight! link SpecialChar    _ORANGE
" highlight! link StorageClass   Keyword
" highlight! link SpecialComment String
" highlight! link Character      Number
" highlight! link Float          Number
" highlight! link Tag            Number
" highlight! link Folded         Number
" highlight! link WarningMsg     Number
" highlight! link iCursor        SpecialKey
" highlight! link SpellLocal     SpellCap
" highlight! link NonText        Comment
" highlight! link DiffDelete     Comment
" highlight! link diffRemoved    Comment
" highlight! link PmenuSbar      _WHITE
" highlight! link PmenuSel       Visual
" highlight! link VisualNOS      Visual
" highlight! link Cursor         StatusLine
" highlight! link Underlined     SpellRare
" highlight! link rstEmphasis    SpellRare
" highlight! link diffChanged    DiffChange

