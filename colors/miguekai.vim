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
let s:black =      {"ctermfg" : "233"}
let s:light_blue = {"ctermfg" : "116"}
let s:black_bg =   {"ctermfg" : "NONE"}

function! s:h(group, fg, bg, attr)
    exec "hi " . a:group . " ctermbg=" . a:bg . " ctermfg=" . a:fg.ctermfg . " cterm=" . a:attr
endfun

hi _GREEN          cterm=NONE ctermfg=82 ctermbg=NONE
hi _RED            cterm=NONE ctermfg=197 ctermbg=NONE
hi _ORANGE         cterm=NONE ctermfg=202 ctermbg=NONE
hi _BLUE           cterm=NONE ctermfg=45 ctermbg=NONE
hi _PURPLE         cterm=NONE ctermfg=99 ctermbg=NONE
hi _PINK           cterm=NONE ctermfg=200 ctermbg=NONE
hi _YELLOW         cterm=NONE ctermfg=179 ctermbg=NONE
hi _WHITE          cterm=NONE ctermfg=230 ctermbg=NONE
hi _GREY           cterm=NONE ctermfg=250 ctermbg=NONE
hi _BLACK          cterm=NONE ctermfg=233 ctermbg=NONE
hi _LIGHT_BLUE     cterm=NONE ctermfg=116 ctermbg=NONE

call s:h("Normal", s:white, "NONE", "NONE")
call s:h("Keyword", s:orange, "NONE", "NONE")
call s:h("Constant", s:pink, "NONE", "NONE")
call s:h("String", s:yellow, "NONE", "NONE")
call s:h("Comment", s:grey, "NONE", "italic")
call s:h("Number", s:yellow, "NONE", "NONE")
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
call s:h("Visual", s:black_bg, s:grey.ctermfg, "NONE")
call s:h("LineNr", s:grey, "NONE", "NONE")
" hi CursorLineNr cterm=NONE ctermbg=NONE ctermfg=202
" hi Cursorline   cterm=NONE ctermbg=233
" hi TablineFill  cterm=NONE ctermbg=Black ctermfg=Black
" hi TablineSel   cterm=NONE ctermbg=NONE ctermfg=202
" hi VertSplit    cterm=NONE ctermbg=NONE ctermfg=233
" hi Statusline   cterm=NONE ctermbg=NONE ctermfg=233
" hi StatusLinenc cterm=NONE ctermbg=NONE ctermfg=214
" hi SpecialKey   cterm=NONE ctermbg=NONE ctermfg=Yellow
" hi Visual       cterm=NONE ctermbg=238 ctermfg=NONE
" hi LineNr       cterm=NONE ctermbg=NONE ctermfg=246

highlight! link Boolean        _PURPLE
highlight! link Delimiter      _WHITE
highlight! link Identifier     _WHITE
highlight! link Title          Normal
highlight! link Debug          Normal
highlight! link Exception      Normal
highlight! link FoldColumn     Normal
highlight! link Macro          _PURPLE
highlight! link ModeMsg        Normal
highlight! link MoreMsg        Normal
highlight! link Question       _PURPLE
highlight! link Conditional    _ORANGE
highlight! link Statement      _ORANGE
highlight! link Operator       _ORANGE
highlight! link Structure      _ORANGE
highlight! link Function       _LIGHT_BLUE
highlight! link Include        _RED
highlight! link Type           _ORANGE
highlight! link Typedef        _ORANGE
highlight! link Todo           Keyword
highlight! link Label          _ORANGE
highlight! link Define         Keyword
highlight! link DiffAdd        _ORANGE
highlight! link diffAdded      Keyword
highlight! link diffCommon     Keyword
highlight! link Directory      Keyword
highlight! link PreCondit      Keyword
highlight! link PreProc        Keyword
highlight! link Repeat         _ORANGE
highlight! link Special        _ORANGE
highlight! link SpecialChar    _ORANGE
highlight! link StorageClass   Keyword
highlight! link SpecialComment String
highlight! link Character      Number
highlight! link Float          Number
highlight! link Tag            Number
highlight! link Folded         Number
highlight! link WarningMsg     Number
highlight! link iCursor        SpecialKey
highlight! link SpellLocal     SpellCap
highlight! link NonText        Comment
highlight! link DiffDelete     Comment
highlight! link diffRemoved    Comment
highlight! link PmenuSbar      _WHITE
highlight! link PmenuSel       Visual
highlight! link VisualNOS      Visual
highlight! link Cursor         StatusLine
highlight! link Underlined     SpellRare
highlight! link rstEmphasis    SpellRare
highlight! link diffChanged    DiffChange

