local M = {}

function M.setup()

  local theme = {}

  theme.colors = {
    background      = "#1C1C1C",
    divisor         = "#262626",
    delimiter       = "#D7AF87",
    grey            = "#585858",
    pastel          = "#D7AFAF",
    visual          = "#303030",
    aqua            = "#87D7AF",
    green           = "#AFAF87",
    blue            = "#5F87AF",
    red             = "#870000",
    orange          = "#D7875F",
    purple          = "#8787AF",
    magenta         = "#D75F5F",
    yellow          = "#FFAF5F",
    pink            = "#DF7C7C",
    cyan            = "#AFD7D7",
    black           = "#121212",
    white           = "#FFFFD7",
    dark_green      = "#1A1900",
    dark_magenta    = "#420000",
    dark_orange     = "#461100",
    none            = "NONE",
  }

  theme.colorscheme = {
    -- Adding initial port to new TS highlight groups.
    ["@function.builtin"] = {fg = theme.colors.orange, bg = theme.colors.none},
    ["@function.macro"]   = {fg = theme.colors.pink, bg = theme.colors.none},
    ["@function.purple"]  = {fg = theme.colors.magenta, bg = theme.colors.none},
    ["@keyword"]          = {fg = theme.colors.magenta, bg = theme.colors.none},
    ["@keyword.function"] = {fg = theme.colors.orange, bg = theme.colors.none},
    ["@constant.macro"]   = {fg = theme.colors.magenta, bg = theme.colors.none},
    ["@constant.builtin"] = {fg = theme.colors.purple, bg = theme.colors.none},
    ["@constructor"]      = {fg = theme.colors.pink, bg = theme.colors.none},
    ["@field"]            = {fg = theme.colors.pastel, bg = theme.colors.none},
    ["@operator"]         = {fg = theme.colors.aqua, bg = theme.colors.none},
    ["@property"]         = {fg = theme.colors.pastel, bg = theme.colors.none},
    ["@macro"]            = {fg = theme.colors.pink, bg = theme.colors.none},
    ["@preproc"]          = {fg = theme.colors.orange, bg = theme.colors.none},
    ["@type.definition"]  = {fg = theme.colors.yellow, bg = theme.colors.none},

    -- Default UI
    Normal       = {fg = theme.colors.white, bg = theme.colors.none},
    Error        = {fg = theme.colors.red, bg = theme.colors.none},
    ErrorMsg     = {fg = theme.colors.red, bg = theme.colors.none},
    Search       = {fg = theme.colors.magenta, bg = theme.colors.none},
    IncSearch    = {fg = theme.colors.magenta, bg = theme.colors.none, reverse = true},
    DiffText     = {fg = theme.colors.yellow, bg = theme.colors.dark_orange, bold = true},
    SignColumn   = {fg = theme.colors.orange, bg = theme.colors.none},
    SpellBad     = {fg = theme.colors.white, bg = theme.colors.none, undercurl = true},
    SpellCap     = {fg = theme.colors.white, bg = theme.colors.none},
    SpellRare    = {fg = theme.colors.red, bg = theme.colors.none},
    WildMenu     = {fg = theme.colors.grey, bg = theme.colors.none},
    Pmenu        = {fg = theme.colors.white, bg = theme.colors.black},
    PmenuSel     = {fg = theme.colors.orange, bg = theme.colors.none},
    PmenuThumb   = {fg = theme.colors.magenta, bg = theme.colors.none},
    PmenuSbar    = {fg = theme.colors.aqua, bg = theme.colors.none},
    MatchParen   = {fg = theme.colors.magenta, bg = theme.colors.none, bold = true},
    NonText      = {fg = theme.colors.grey, bg = theme.colors.none},
    CursorLineNr = {fg = theme.colors.orange, bg = theme.colors.none},
    CursorLine   = {fg = theme.colors.none, bg = theme.colors.divisor},
    TabLineSel   = {fg = theme.colors.orange, bg = theme.colors.none},
    TabLineFill  = {fg = theme.colors.none, bg = theme.colors.divisor},
    TabLine      = {fg = theme.colors.none, bg = theme.colors.divisor},
    Title        = {fg = theme.colors.white, bg = theme.colors.divisor},
    VertSplit    = {fg = theme.colors.divisor, bg = theme.colors.none},
    StatusLineNc = {fg = theme.colors.divisor, bg = theme.colors.none},
    SpecialKey   = {fg = theme.colors.yellow, bg = theme.colors.none},
    Visual       = {fg = theme.colors.none, bg = theme.colors.visual},
    LineNr       = {fg = theme.colors.grey, bg = theme.colors.none},
    MsgArea      = {fg = theme.colors.white, bg = theme.colors.none},

    -- Syntax
    StorageClass = {fg = theme.colors.green, bg = theme.colors.none},
    Keyword      = {fg = theme.colors.orange, bg = theme.colors.none},
    Comment      = {fg = theme.colors.grey, bg = theme.colors.none},
    Constant     = {fg = theme.colors.pastel, bg = theme.colors.none},
    String       = {fg = theme.colors.cyan, bg = theme.colors.none},
    Number       = {fg = theme.colors.purple, bg = theme.colors.none},
    Float        = {fg = theme.colors.purple, bg = theme.colors.none},
    Character    = {fg = theme.colors.cyan, bg = theme.colors.none},
    Boolean      = {fg = theme.colors.purple, bg = theme.colors.none},
    Identifier   = {fg = theme.colors.pastel, bg = theme.colors.none},
    Function     = {fg = theme.colors.green, bg = theme.colors.none},
    Statement    = {fg = theme.colors.magenta, bg = theme.colors.none},
    Conditional  = {fg = theme.colors.magenta, bg = theme.colors.none},
    Repeat       = {fg = theme.colors.magenta, bg = theme.colors.none},
    Label        = {fg = theme.colors.pastel, bg = theme.colors.none},
    Operator     = {fg = theme.colors.aqua, bg = theme.colors.none},
    Exception    = {fg = theme.colors.magenta, bg = theme.colors.none},
    Type         = {fg = theme.colors.yellow, bg = theme.colors.none},
    Structure    = {fg = theme.colors.magenta, bg = theme.colors.none},
    Typedef      = {fg = theme.colors.magenta, bg = theme.colors.none},
    PreProc      = {fg = theme.colors.purple, bg = theme.colors.none},
    Include      = {fg = theme.colors.magenta, bg = theme.colors.none},
    Define       = {fg = theme.colors.magenta, bg = theme.colors.none},
    PreCondit    = {fg = theme.colors.blue, bg = theme.colors.none},
    Macro        = {fg = theme.colors.blue, bg = theme.colors.none},
    Special      = {fg = theme.colors.purple, bg = theme.colors.none},
    SpecialChar  = {fg = theme.colors.purple, bg = theme.colors.none},
    Tag          = {fg = theme.colors.yellow, bg = theme.colors.none},
    Delimiter    = {fg = theme.colors.delimiter, bg = theme.colors.none},
    SpecialComment = {fg = theme.colors.purple, bg = theme.colors.none},
    Debug          = {fg = theme.colors.red, bg = theme.colors.none},
    Underlined     = {fg = theme.colors.red, bg = theme.colors.none},
    Ignore         = {fg = theme.colors.green, bg = theme.colors.none},
    Todo           = {fg = theme.colors.red, bg = theme.colors.none},
    Conceal        = {fg = theme.colors.red, bg = theme.colors.none},
    Directory      = {fg = theme.colors.green, bg = theme.colors.none},
    FoldColumn     = {fg = theme.colors.yellow, bg = theme.colors.none},
    ModeMsg        = {fg = theme.colors.white, bg = theme.colors.none},
    MoreMsg        = {fg = theme.colors.white, bg = theme.colors.none},
    Question       = {fg = theme.colors.magenta, bg = theme.colors.none},
    DiffAdd        = {fg = theme.colors.green, bg = theme.colors.dark_green, bold = true},
    DiffDelete     = {fg = theme.colors.magenta, bg = theme.colors.dark_magenta, bold = true},
    DiffChange     = {fg = theme.colors.yellow, bg = theme.colors.dark_orange, bold = true},
    diffAdded      = {fg = theme.colors.delimiter, bg = theme.colors.none},
    diffCommon     = {fg = theme.colors.green, bg = theme.colors.none},
    Folded         = {fg = theme.colors.grey, bg = theme.colors.none},
    WarningMsg     = {fg = theme.colors.green, bg = theme.colors.none},

    -- Cmp
    CmpItemMenuDefault = {fg = theme.colors.magenta, bg = theme.colors.black},
    CmpItemAbbrDefault = {fg = theme.colors.white, bg = theme.colors.black},
    CmpItemAbbrMatch   = {fg = theme.colors.white, bg = theme.colors.black, bold = true},
    CmpItemKindDefault = {fg = theme.colors.magenta, bg = theme.colors.black},

    -- LSP diagnostics
    DiagnosticError = {fg = theme.colors.red, bg = theme.colors.background},
    DiagnosticInfo  = {fg = theme.colors.blue, bg = theme.colors.background},
    DiagnosticWarn  = {fg = theme.colors.yellow, bg = theme.colors.background},

    -- Git gutter
    GitGutterDelete = {fg = theme.colors.magenta, bg = theme.colors.background},
    GitGutterAdd    = {fg = theme.colors.green, bg = theme.colors.background},
    GitGutterChange = {fg = theme.colors.yellow, bg = theme.colors.background},

    -- TreeSitter Context
    TreesitterContext           = {fg = theme.colors.white, bg = theme.colors.background},
    TreesitterContextLineNumber = {fg = theme.colors.orange, bg = theme.colors.none},

    -- NvimTree
    NvimTreeStatusLine   = {fg = theme.colors.background, bg = theme.colors.background},
    NvimTreeStatusLineNc = {fg = theme.colors.background, bg = theme.colors.background},
    NvimTreeIndentMarker = {fg = theme.colors.visual, bg = theme.colors.none},

    -- Python syntax
    --[[ pythonTSConstBuiltin    = {fg = theme.colors.purple, bg = theme.colors.none},
    pythonTSFuncBuiltin     = {fg = theme.colors.green, bg = theme.colors.none},
    pythonTSKeywordOperator = {fg = theme.colors.magenta, bg = theme.colors.none},
    pythonTSConstructor     = {fg = theme.colors.yellow, bg = theme.colors.none}, ]]

    -- Lua syntax
    --[[ luaTSOperator        = {fg = theme.colors.aqua, bg = theme.colors.none},
    luaTSConstructor     = {fg = theme.colors.delimiter, bg = theme.colors.none},
    luaTSKeywordOperator = {fg = theme.colors.magenta, bg = theme.colors.none},
    luaTSKeyword         = {fg = theme.colors.magenta, bg = theme.colors.none},
    luaTSFuncBuiltin     = {fg = theme.colors.magenta, bg = theme.colors.none}, ]]

    -- Rust syntax
    --[[ rustMacro          = {fg = theme.colors.magenta, bg = theme.colors.none},
    rustTSFuncMacro    = {fg = theme.colors.magenta, bg = theme.colors.none},
    rustTSNamespace    = {fg = theme.colors.white, bg = theme.colors.none},
    rustTSConstBuiltin = {fg = theme.colors.magenta, bg = theme.colors.none},
    rustGenericRegion  = {fg = theme.colors.magenta, bg = theme.colors.none}, ]]

    -- Ruby syntax
    --[[ rubyModuleName = {fg = theme.colors.magenta, bg = theme.colors.none},
    rubyModule     = {fg = theme.colors.magenta, bg = theme.colors.none} ]]
  }

  return theme
end

return M
