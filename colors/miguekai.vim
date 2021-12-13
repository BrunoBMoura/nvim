set background=dark
highlight clear
syntax reset

let g:colors_name = "miguekai"

let s:green =      {"ctermfg" : "82"}
let s:red =        {"ctermfg" : "197"}
let s:orange =     {"ctermfg" : "203"}
let s:blue =       {"ctermfg" : "45"}
let s:purple =     {"ctermfg" : "99"}
let s:pink =       {"ctermfg" : "168"}
let s:yellow =     {"ctermfg" : "179"}
let s:white =      {"ctermfg" : "230"}
let s:grey =       {"ctermfg" : "250"}
let s:black =      {"ctermfg" : "234"}

let s:light_blue = {"ctermfg" : "159"}
let s:black_bg =   {"ctermfg" : "NONE"}
let s:visual_grey = {"ctermfg": "240"}
let s:identifier = {"ctermfg": "181"}

function! s:h(group, fg, bg, attr)
    exec "hi " . a:group . " ctermbg=" . a:bg . " ctermfg=" . a:fg.ctermfg . " cterm=" . a:attr
endfun

" UI colors
call s:h("Normal", s:white, "NONE", "NONE")
call s:h("Error", s:red, "NONE", "NONE")
call s:h("ErrorMsg", s:red, "NONE", "NONE")
call s:h("Search", s:pink, "NONE", "NONE")
call s:h("IncSearch", s:pink, "NONE", "reverse")
call s:h("DiffChange", s:orange, "NONE", "reverse")
call s:h("DiffText", s:orange, "NONE", "bold")
call s:h("SignColumn", s:orange, "NONE", "NONE")
call s:h("SpellBad", s:white, "NONE", "undercurl")
call s:h("SpellCap", s:white, "NONE", "NONE")
call s:h("SpellRare", s:red, "NONE", "NONE")
call s:h("WildMenu", s:grey, "NONE", "NONE")
call s:h("Pmenu", s:white, "NONE", "NONE")
call s:h("PmenuThumb", s:black, "NONE", "NONE")
call s:h("SpecialKey", s:black, "NONE", "NONE")
call s:h("MatchParen", s:orange, "NONE", "NONE")
call s:h("TabLineSel", s:orange, "NONE", "NONE")
call s:h("StatusLine", s:black, "NONE", "NONE")

" Custom configurations
call s:h("CursorLineNr", s:orange, "NONE", "NONE")
call s:h("CursorLine", s:black_bg, s:black.ctermfg, "NONE")
call s:h("TabLineFill", s:black_bg, "NONE", "NONE")
call s:h("VertSplit", s:black, "NONE", "NONE")
call s:h("StatusLine", s:black, "NONE", "NONE")
call s:h("StatusLineNc", s:black, "NONE", "NONE")
call s:h("SpecialKey", s:yellow, "NONE", "NONE")
call s:h("Visual", s:black_bg, s:visual_grey.ctermfg, "NONE")
call s:h("LineNr", s:grey, "NONE", "NONE")

" Syntax colors
call s:h("Keyword", s:orange, "NONE", "NONE")
call s:h("Comment", s:grey, "NONE", "italic")
call s:h("Constant", s:pink, "NONE", "NONE")
call s:h("String", s:yellow, "NONE", "NONE")
call s:h("Number", s:yellow, "NONE", "NONE")
call s:h("Float", s:yellow, "NONE", "NONE")
call s:h("Character", s:yellow, "NONE", "NONE")
call s:h("Boolean", s:purple, "NONE", "NONE")

call s:h("Identifier", s:identifier, "NONE", "NONE")
call s:h("Function", s:light_blue, "NONE", "NONE")
call s:h("Statement", s:orange, "NONE", "NONE")
call s:h("Conditional", s:orange, "NONE", "NONE")
call s:h("Repeat", s:orange, "NONE", "NONE")
call s:h("Label", s:identifier, "NONE", "NONE")
call s:h("Operator", s:orange, "NONE", "NONE")
call s:h("Keyword", s:orange, "NONE", "NONE")
call s:h("Exception", s:pink, "NONE", "NONE")

call s:h("PreProc", s:red, "NONE", "NONE")
call s:h("Include", s:red, "NONE", "NONE")
call s:h("Define", s:red, "NONE", "NONE")
call s:h("PreCondit", s:red, "NONE", "NONE")
call s:h("Macro", s:pink, "NONE", "NONE")

call s:h("Type", s:orange, "NONE", "NONE")
call s:h("StorageClass", s:orange, "NONE", "NONE")
call s:h("Structure", s:orange, "NONE", "NONE")
call s:h("Typedef", s:red, "NONE", "NONE")

call s:h("Special", s:white, "NONE", "NONE")
call s:h("SpecialChar", s:white, "NONE", "NONE")
call s:h("Tag", s:yellow, "NONE", "NONE")
call s:h("Delimiter", s:identifier, "NONE", "NONE")
call s:h("SpecialComment", s:red, "NONE", "NONE")
call s:h("Debug", s:red, "NONE", "NONE")
call s:h("Underlined", s:red, "NONE", "NONE")
call s:h("Ignore", s:green, "NONE", "NONE")
call s:h("Error", s:red, "NONE", "NONE")
call s:h("Todo", s:red, "NONE", "NONE")


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

