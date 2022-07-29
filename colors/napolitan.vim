hi clear
if exists("syntax_on")
    syntax reset
endif

let g:colors_name = "napolitan"

let g:napolitan_background  = "234"
let g:napolitan_divisor     = "235"
let g:napolitan_delimiter   = "180"
let g:napolitan_grey        = "240"
let g:napolitan_dark_grey   = "181"
let g:napolitan_visual      = "236"
let g:napolitan_string      = "151"
let g:napolitan_aqua        = "079"
let g:napolitan_green       = "144"
let g:napolitan_blue        = "067"
let g:napolitan_red         = "088"
let g:napolitan_orange      = "173"
let g:napolitan_purple      = "103"
let g:napolitan_pink        = "167"
let g:napolitan_yellow      = "215"
let g:napolitan_cyan        = "152"
let g:napolitan_black       = "233"
let g:napolitan_white       = "230"

fun! s:term_highlight(group, fg, bg, attr)
    exec "hi! " . a:group . " ctermbg=" . a:bg . " ctermfg=" . a:fg. " cterm=" . a:attr
endfun

let g:napolitan_off_pink    = "211"
let g:napolitan_off_pink    = "211"
" UI colors
call s:term_highlight("Normal",     g:napolitan_white,   "NONE", "NONE")
call s:term_highlight("Error",      g:napolitan_red,     "NONE", "NONE")
call s:term_highlight("ErrorMsg",   g:napolitan_red,     "NONE", "NONE")
call s:term_highlight("Search",     g:napolitan_pink,    "NONE", "NONE")
call s:term_highlight("IncSearch",  g:napolitan_pink,    "NONE", "reverse")
call s:term_highlight("DiffChange", g:napolitan_orange,  "NONE", "reverse")
call s:term_highlight("DiffText",   g:napolitan_orange,  "NONE", "NONE")
call s:term_highlight("SignColumn", g:napolitan_orange,  "NONE", "NONE")
call s:term_highlight("SpellBad",   g:napolitan_white,   "NONE", "undercurl")
call s:term_highlight("SpellCap",   g:napolitan_white,   "NONE", "NONE")
call s:term_highlight("SpellRare",  g:napolitan_red,     "NONE", "NONE")
call s:term_highlight("WildMenu",   g:napolitan_black,   "NONE", "NONE")
call s:term_highlight("Pmenu",      g:napolitan_white,   "NONE", "NONE")
call s:term_highlight("PmenuThumb", g:napolitan_divisor, "NONE", "NONE")
call s:term_highlight("MatchParen", g:napolitan_pink,    "NONE", "NONE")
call s:term_highlight("NonText",    g:napolitan_grey,    "NONE", "NONE")

" Custom configurations
call s:term_highlight("StatusLine",   g:napolitan_divisor, "NONE",              "NONE")
call s:term_highlight("CursorLineNr", g:napolitan_orange,  "NONE",              "NONE")
call s:term_highlight("CursorLine",   "NONE",              g:napolitan_divisor, "NONE")
call s:term_highlight("TabLineSel",   g:napolitan_orange,  "NONE",              "NONE")
call s:term_highlight("TabLineFill",  "NONE",              g:napolitan_divisor, "NONE")
call s:term_highlight("TabLine",      "NONE",              g:napolitan_divisor, "NONE")
call s:term_highlight("Title",        g:napolitan_white,   g:napolitan_divisor, "NONE")
call s:term_highlight("VertSplit",    g:napolitan_divisor, "NONE",              "NONE")
call s:term_highlight("StatusLine",   g:napolitan_divisor, "NONE",              "NONE")
call s:term_highlight("StatusLineNc", g:napolitan_divisor, "NONE",              "NONE")
call s:term_highlight("SpecialKey",   g:napolitan_yellow,  "NONE",              "NONE")
call s:term_highlight("Visual",       "NONE",              g:napolitan_visual,  "NONE")
call s:term_highlight("LineNr",       g:napolitan_grey,    "NONE",              "NONE")
call s:term_highlight("MsgArea",      g:napolitan_white,   "NONE",              "NONE")

" Syntax colors
call s:term_highlight("StorageClass", g:napolitan_green,     "NONE", "NONE")
call s:term_highlight("Keyword",      g:napolitan_orange,    "NONE", "NONE")
call s:term_highlight("Comment",      g:napolitan_grey,      "NONE", "NONE")
call s:term_highlight("Constant",     g:napolitan_dark_grey, "NONE", "NONE")
call s:term_highlight("String",       g:napolitan_string,    "NONE", "NONE")
call s:term_highlight("Number",       g:napolitan_purple,    "NONE", "NONE")
call s:term_highlight("Float",        g:napolitan_purple,    "NONE", "NONE")
call s:term_highlight("Character",    g:napolitan_cyan,      "NONE", "NONE")
call s:term_highlight("Boolean",      g:napolitan_purple,    "NONE", "NONE")
call s:term_highlight("Identifier",   g:napolitan_dark_grey, "NONE", "NONE")
call s:term_highlight("Function",     g:napolitan_green,     "NONE", "NONE")
call s:term_highlight("Statement",    g:napolitan_pink,      "NONE", "NONE")
call s:term_highlight("Conditional",  g:napolitan_pink,      "NONE", "NONE")
call s:term_highlight("Repeat",       g:napolitan_pink,      "NONE", "NONE")
call s:term_highlight("Label",        g:napolitan_dark_grey, "NONE", "NONE")
call s:term_highlight("Operator",     g:napolitan_aqua,      "NONE", "NONE")
call s:term_highlight("Exception",    g:napolitan_pink,      "NONE", "NONE")
call s:term_highlight("Type",         g:napolitan_yellow,    "NONE", "NONE")
call s:term_highlight("Structure",    g:napolitan_pink,      "NONE", "NONE")
call s:term_highlight("Typedef",      g:napolitan_pink,      "NONE", "NONE")
call s:term_highlight("PreProc",      g:napolitan_purple,    "NONE", "NONE")
call s:term_highlight("Include",      g:napolitan_pink,      "NONE", "NONE")
call s:term_highlight("Define",       g:napolitan_pink,      "NONE", "NONE")
call s:term_highlight("PreCondit",    g:napolitan_blue,      "NONE", "NONE")
call s:term_highlight("Macro",        g:napolitan_aqua,      "NONE", "NONE")

" Display related
call s:term_highlight("Special",        g:napolitan_aqua,      "NONE", "NONE")
call s:term_highlight("SpecialChar",    g:napolitan_purple,    "NONE", "NONE")
call s:term_highlight("Tag",            g:napolitan_yellow,    "NONE", "NONE")
call s:term_highlight("Delimiter",      g:napolitan_delimiter, "NONE", "NONE")
call s:term_highlight("SpecialComment", g:napolitan_purple,    "NONE", "NONE")
call s:term_highlight("Debug",          g:napolitan_red,       "NONE", "NONE")
call s:term_highlight("Underlined",     g:napolitan_red,       "NONE", "NONE")
call s:term_highlight("Ignore",         g:napolitan_green,     "NONE", "NONE")
call s:term_highlight("Error",          g:napolitan_red,       "NONE", "NONE")
call s:term_highlight("Todo",           g:napolitan_red,       "NONE", "NONE")
call s:term_highlight("Conceal",        g:napolitan_red,       "NONE", "NONE")
call s:term_highlight("Directory",      g:napolitan_green,     "NONE", "NONE")
call s:term_highlight("FoldColumn",     g:napolitan_yellow,    "NONE", "NONE")
call s:term_highlight("ModeMsg",        g:napolitan_white,     "NONE", "NONE")
call s:term_highlight("MoreMsg",        g:napolitan_white,     "NONE", "NONE")
call s:term_highlight("Question",       g:napolitan_pink,      "NONE", "NONE")
call s:term_highlight("DiffAdd",        g:napolitan_pink,      "NONE", "NONE")
call s:term_highlight("diffAdded",      g:napolitan_red,       "NONE", "NONE")
call s:term_highlight("diffCommon",     g:napolitan_green,     "NONE", "NONE")
call s:term_highlight("Folded",         g:napolitan_purple,    "NONE", "NONE")
call s:term_highlight("WarningMsg",     g:napolitan_green,     "NONE", "NONE")

" Plugin related
call s:term_highlight("TreesitterContext",           g:napolitan_white,  g:napolitan_background, "NONE")
call s:term_highlight("TreesitterContextLineNumber", g:napolitan_orange,  "NONE", "NONE")

" Custom highlighting
" Python
call s:term_highlight("pythonTSConstBuiltin",    g:napolitan_purple, "NONE", "NONE")
call s:term_highlight("pythonTSFuncBuiltin",     g:napolitan_green,  "NONE", "NONE")
call s:term_highlight("pythonTSKeywordOperator", g:napolitan_pink,   "NONE", "NONE")
call s:term_highlight("pythonTSConstructor",     g:napolitan_yellow, "NONE", "NONE")

" Lua
call s:term_highlight("luaTSOperator",        g:napolitan_aqua, "NONE", "NONE")
call s:term_highlight("luaTSConstructor",     g:napolitan_delimiter, "NONE", "NONE")
call s:term_highlight("luaTSKeywordOperator", g:napolitan_pink, "NONE", "NONE")
call s:term_highlight("luaTSKeyword",         g:napolitan_pink, "NONE", "NONE")
call s:term_highlight("luaTSFuncBuiltin",     g:napolitan_pink, "NONE", "NONE")

" Rust
call s:term_highlight("rustTSConstBuiltin", g:napolitan_orange, "NONE", "NONE")
call s:term_highlight("rustTSFuncMacro",    g:napolitan_pink, "NONE", "NONE")
call s:term_highlight("rustTSNamespace",    g:napolitan_white, "NONE", "NONE")
call s:term_highlight("rustTSInclude",      g:napolitan_pink, "NONE", "NONE")
