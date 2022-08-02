local M = {}

function M.setup()

  local theme = {}

  theme.colors = {
    snip_background = "#121212", -- 233
    background      = "#1C1C1C", -- 234
    divisor         = "#262626", -- 235
    delimiter       = "#d7af87", -- 180
    grey            = "#585858", -- 240
    dark_grey       = "#D7AFAF", -- 181
    visual          = "#303030", -- 236
    string          = "#AFD7AF", -- 151
    aqua            = "#5FD7AF", -- 079
    green           = "#AFAF87", -- 144
    blue            = "#5F87AF", -- 067
    red             = "#870000", -- 088
    orange          = "#D7875F", -- 173
    purple          = "#8787AF", -- 103
    pink            = "#D75F5F", -- 167
    yellow          = "#FFAF5F", -- 215
    cyan            = "#AFD7D7", -- 152
    black           = "#121212", -- 233
    white           = "#FFFFD7", -- 230
    none            = "NONE",
  }

  theme.colorscheme = {
    -- Default UI
    Normal = {fg = theme.colors.white, bg = theme.colors.none},
    Error = {fg = theme.colors.red, bg = theme.colors.none},
    ErrorMsg = {fg = theme.colors.red, bg = theme.colors.none},
    Search = {fg = theme.colors.pink, bg = theme.colors.none},
    IncSearch = {fg = theme.colors.pink, bg = theme.colors.none, reverse = true},
    DiffChange = {fg = theme.colors.orange, bg = theme.colors.none, reverse = true},
    DiffText = {fg = theme.colors.orange, bg = theme.colors.none},
    SignColumn = {fg = theme.colors.orange, bg = theme.colors.none},
    SpellBad = {fg = theme.colors.white, bg = theme.colors.none, undercurl = true},
    SpellCap = {fg = theme.colors.white, bg = theme.colors.none},
    SpellRare = {fg = theme.colors.red, bg = theme.colors.none},
    WildMenu = {fg = theme.colors.black, bg = theme.colors.none},
    Pmenu = {fg = theme.colors.orange, bg = theme.colors.snip_background},
    PmenuThumb = {fg = theme.colors.divisor, bg = theme.colors.none},
    MatchParen = {fg = theme.colors.pink, bg = theme.colors.none, bold = true},
    NonText = {fg = theme.colors.grey, bg = theme.colors.none},
    CursorLineNr = {fg = theme.colors.orange, bg = theme.colors.none},
    CursorLine = {fg = theme.colors.none, bg = theme.colors.divisor},
    TabLineSel = {fg = theme.colors.orange, bg = theme.colors.none},
    TabLineFill = {fg = theme.colors.none, bg = theme.colors.divisor},
    TabLine = {fg = theme.colors.none, bg = theme.colors.divisor},
    Title = {fg = theme.colors.white, bg = theme.colors.divisor},
    VertSplit = {fg = theme.colors.divisor, bg = theme.colors.none},
    StatusLineNc = {fg = theme.colors.divisor, bg = theme.colors.none},
    SpecialKey = {fg = theme.colors.yellow, bg = theme.colors.none},
    Visual = {fg = theme.colors.none, bg = theme.colors.visual},
    LineNr = {fg = theme.colors.grey, bg = theme.colors.none},
    MsgArea = {fg = theme.colors.white, bg = theme.colors.none},

    -- Syntax
    StorageClass = {fg = theme.colors.green, bg = theme.colors.none},
    Keyword = {fg = theme.colors.orange, bg = theme.colors.none},
    Comment = {fg = theme.colors.grey, bg = theme.colors.none},
    Constant = {fg = theme.colors.dark_grey, bg = theme.colors.none},
    String = {fg = theme.colors.string, bg = theme.colors.none},
    Number = {fg = theme.colors.purple, bg = theme.colors.none},
    Float = {fg = theme.colors.purple, bg = theme.colors.none},
    Character = {fg = theme.colors.cyan, bg = theme.colors.none},
    Boolean = {fg = theme.colors.purple, bg = theme.colors.none},
    Identifier = {fg = theme.colors.dark_grey, bg = theme.colors.none},
    Function = {fg = theme.colors.green, bg = theme.colors.none},
    Statement = {fg = theme.colors.pink, bg = theme.colors.none},
    Conditional = {fg = theme.colors.pink, bg = theme.colors.none},
    Repeat = {fg = theme.colors.pink, bg = theme.colors.none},
    Label = {fg = theme.colors.dark_grey, bg = theme.colors.none},
    Operator = {fg = theme.colors.aqua, bg = theme.colors.none},
    Exception = {fg = theme.colors.pink, bg = theme.colors.none},
    Type = {fg = theme.colors.yellow, bg = theme.colors.none},
    Structure = {fg = theme.colors.pink, bg = theme.colors.none},
    Typedef = {fg = theme.colors.pink, bg = theme.colors.none},
    PreProc = {fg = theme.colors.purple, bg = theme.colors.none},
    Include = {fg = theme.colors.pink, bg = theme.colors.none},
    Define = {fg = theme.colors.pink, bg = theme.colors.none},
    PreCondit = {fg = theme.colors.blue, bg = theme.colors.none},
    Macro = {fg = theme.colors.aqua, bg = theme.colors.none},
    Special = {fg = theme.colors.aqua, bg = theme.colors.none},
    SpecialChar = {fg = theme.colors.purple, bg = theme.colors.none},
    Tag = {fg = theme.colors.yellow, bg = theme.colors.none},
    Delimiter = {fg = theme.colors.delimiter, bg = theme.colors.none},
    SpecialComment = {fg = theme.colors.purple, bg = theme.colors.none},
    Debug = {fg = theme.colors.red, bg = theme.colors.none},
    Underlined = {fg = theme.colors.red, bg = theme.colors.none},
    Ignore = {fg = theme.colors.green, bg = theme.colors.none},
    Todo = {fg = theme.colors.red, bg = theme.colors.none},
    Conceal = {fg = theme.colors.red, bg = theme.colors.none},
    Directory = {fg = theme.colors.green, bg = theme.colors.none},
    FoldColumn = {fg = theme.colors.yellow, bg = theme.colors.none},
    ModeMsg = {fg = theme.colors.white, bg = theme.colors.none},
    MoreMsg = {fg = theme.colors.white, bg = theme.colors.none},
    Question = {fg = theme.colors.pink, bg = theme.colors.none},
    DiffAdd = {fg = theme.colors.pink, bg = theme.colors.none},
    diffAdded = {fg = theme.colors.red, bg = theme.colors.none},
    diffCommon = {fg = theme.colors.green, bg = theme.colors.none},
    Folded = {fg = theme.colors.purple, bg = theme.colors.none},
    WarningMsg = {fg = theme.colors.green, bg = theme.colors.none},

    -- Cmp
    CmpItemMenuDefault = {fg = theme.colors.orange, bg = theme.colors.snip_background},
    CmpItemAbbrDefault = {fg = theme.colors.white, bg = theme.colors.snip_background},
    CmpItemAbbrMatch = {fg = theme.colors.white, bg = theme.colors.snip_background, bold = true},
    CmpItemKindDefault = {fg = theme.colors.pink, bg = theme.colors.snip_background},

    -- LSP diagnostics
    DiagnosticError = {fg = theme.colors.red, bg = theme.colors.background},
    DiagnosticInfo = {fg = theme.colors.blue, bg = theme.colors.background},
    DiagnosticWarn = {fg = theme.colors.yellow, bg = theme.colors.background},

    GitGutterDelete = {fg = theme.colors.pink, bg = theme.colors.background},
    GitGutterAdd = {fg = theme.colors.green, bg = theme.colors.background},
    GitGutterChange = {fg = theme.colors.yellow, bg = theme.colors.background},

    -- TreeSitter Context
    TreesitterContext = {fg = theme.colors.white, bg = theme.colors.background},
    TreesitterContextLineNumber = {fg = theme.colors.orange, bg = theme.colors.none},

    -- NvimTree
    NvimTreeStatusLine = {fg = theme.colors.background, bg = theme.colors.background},
    NvimTreeStatusLineNc = {fg = theme.colors.background, bg = theme.colors.background},
    NvimTreeIndentMarker = {fg = theme.colors.visual, bg = theme.colors.none},

    -- Python syntax
    pythonTSConstBuiltin = {fg = theme.colors.purple, bg = theme.colors.none},
    pythonTSFuncBuiltin = {fg = theme.colors.green, bg = theme.colors.none},
    pythonTSKeywordOperator = {fg = theme.colors.pink, bg = theme.colors.none},
    pythonTSConstructor = {fg = theme.colors.yellow, bg = theme.colors.none},

    -- Lua syntax
    luaTSOperator = {fg = theme.colors.aqua, bg = theme.colors.none},
    luaTSConstructor = {fg = theme.colors.delimiter, bg = theme.colors.none},
    luaTSKeywordOperator = {fg = theme.colors.pink, bg = theme.colors.none},
    luaTSKeyword = {fg = theme.colors.pink, bg = theme.colors.none},
    luaTSFuncBuiltin = {fg = theme.colors.pink, bg = theme.colors.none},

    -- Rust syntax
    rustTSFuncMacro = {fg = theme.colors.pink, bg = theme.colors.none},
    rustTSNamespace = {fg = theme.colors.white, bg = theme.colors.none},
  }

  return theme
end

return M
