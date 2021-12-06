let g:colors_name = "miguekai"

" green = 82
" red = 197
" orange = 202
" blue = 33
" purple = 134
" pink = 200
" yellow = 230
" white = 230
" grey = 250
" dark grey = 238
" black = 233
" skin = 120

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
hi _LIGHT_BLUE     cterm=NONE ctermfg=123 ctermbg=NONE

hi Normal     cterm=NONE ctermfg=230 ctermbg=NONE
hi Keyword    cterm=NONE ctermfg=197 ctermbg=NONE
hi Constant   cterm=NONE ctermfg=168 ctermbg=NONE
hi String     cterm=NONE ctermfg=179 ctermbg=NONE
hi Comment    cterm=NONE ctermfg=246 ctermbg=NONE
hi Number     cterm=NONE ctermfg=214 ctermbg=NONE
hi Error      cterm=NONE ctermfg=197 ctermbg=NONE
hi ErrorMsg   cterm=NONE ctermfg=160 ctermbg=NONE
hi Search     cterm=NONE ctermfg=203 ctermbg=NONE
hi IncSearch  cterm=reverse ctermfg=204 ctermbg=NONE
hi DiffChange cterm=NONE ctermfg=202 ctermbg=NONE
hi DiffText   cterm=bold ctermfg=246 ctermbg=NONE
hi SignColumn cterm=NONE ctermfg=202 ctermbg=NONE
hi SpellBad   cterm=undercurl ctermfg=White ctermbg=NONE
hi SpellCap   cterm=NONE ctermfg=White ctermbg=NONE
hi SpellRare  cterm=NONE ctermfg=Red ctermbg=NONE
hi WildMenu   cterm=NONE ctermfg=246 ctermbg=NONE
hi Pmenu      cterm=NONE ctermfg=230 ctermbg=NONE
hi PmenuThumb cterm=NONE ctermfg=233 ctermbg=NONE
hi SpecialKey cterm=NONE ctermfg=233 ctermbg=NONE
hi MatchParen cterm=NONE ctermfg=202 ctermbg=NONE

hi CursorLineNr cterm=NONE ctermbg=NONE ctermfg=202
hi Cursorline   cterm=NONE ctermbg=233
hi TablineFill  ctermbg=233 ctermfg=233
hi TablineSel   ctermbg=NONE ctermfg=202
hi VertSplit    cterm=NONE ctermbg=NONE ctermfg=233
hi Statusline   cterm=NONE ctermbg=NONE ctermfg=233
hi StatusLinenc cterm=NONE ctermbg=NONE ctermfg=214
hi SpecialKey   cterm=NONE ctermbg=NONE ctermfg=Yellow
hi Visual       cterm=NONE ctermbg=238 ctermfg=NONE
hi LineNr       cterm=NONE ctermbg=NONE ctermfg=246

highlight! link Boolean _PURPLE
highlight! link Delimiter _WHITE
highlight! link Identifier _WHITE
highlight! link Title Normal
highlight! link Debug Normal
highlight! link Exception Normal
highlight! link FoldColumn Normal
highlight! link Macro  _PURPLE
highlight! link ModeMsg Normal
highlight! link MoreMsg Normal
highlight! link Question _PURPLE
highlight! link Conditional _ORANGE
highlight! link Statement _ORANGE
highlight! link Operator _ORANGE
highlight! link Structure _ORANGE
highlight! link Function _LIGHT_BLUE
highlight! link Include _RED
highlight! link Type _ORANGE
highlight! link Typedef _ORANGE
highlight! link Todo Keyword
highlight! link Label _ORANGE
highlight! link Define _ORANGE
highlight! link DiffAdd Keyword
highlight! link diffAdded Keyword
highlight! link diffCommon Keyword
highlight! link Directory Keyword
highlight! link PreCondit Keyword
highlight! link PreProc Keyword
highlight! link Repeat _ORANGE
highlight! link Special _ORANGE
highlight! link SpecialChar Keyword
highlight! link SpecialChar _ORANGE
highlight! link StorageClass Keyword
highlight! link SpecialComment String
highlight! link Character Number
highlight! link Float Number
highlight! link Tag Number
highlight! link Folded Number
highlight! link WarningMsg Number
highlight! link iCursor SpecialKey
highlight! link SpellLocal SpellCap
highlight! link NonText Comment
highlight! link DiffDelete Comment
highlight! link diffRemoved Comment
highlight! link PmenuSbar _WHITE
highlight! link PmenuSel Visual
highlight! link VisualNOS Visual
highlight! link Cursor StatusLine
highlight! link Underlined SpellRare
highlight! link rstEmphasis SpellRare
highlight! link diffChanged DiffChange
