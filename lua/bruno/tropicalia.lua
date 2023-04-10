local M = {}

local function highlight(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

local colors = {
  background      = "#1D1C19",
  visual          = "#303030",
  divisor         = "#262626",
  operator        = "#917377",
  khaki           = "#C3AA97",
  cyan            = "#99A59D",
  grey            = "#585858",
  aqua            = "#83BAA5",
  green           = "#BDBB89",
  forest          = "#779576",
  blue            = "#4B878E",
  red             = "#D75F5F",
  orange          = "#D87C6C",
  purple          = "#B78C99",
  yellow          = "#D19F77",
  pink            = "#DF7C7C",
  black           = "#171717",
  white           = "#DED3B1",
  viridian        = "#618E82"
}

local code_syntax = {
  Comment      = {fg = colors.grey,   bg = colors.background},
  Constant     = {fg = colors.cyan,   bg = colors.background},
  String       = {fg = colors.cyan,   bg = colors.background},
  Character    = {fg = colors.forest, bg = colors.background},
  Number       = {fg = colors.purple},
  Float        = {fg = colors.purple},
  Boolean      = {fg = colors.purple},

  Identifier   = {fg = colors.white,  bg = colors.background},
  Function     = {fg = colors.green,  bg = colors.background},

  Keyword      = {fg = colors.orange, bg = colors.background},
  Statement    = {fg = colors.orange, bg = colors.background},
  Conditional  = {fg = colors.orange},
  Repeat       = {fg = colors.orange},
  Label        = {fg = colors.cyan},
  Operator     = {fg = colors.khaki,  bg = colors.background},
  Exception    = {fg = colors.red},

  PreProc      = {fg = colors.purple, bg = colors.background},
  Include      = {fg = colors.blue,   bg = colors.background},
  Define       = {fg = colors.blue,   bg = colors.background},
  PreCondit    = {fg = colors.blue,   bg = colors.background},
  Macro        = {fg = colors.purple, bg = colors.background},

  StorageClass = {fg = colors.pink,   bg = colors.background},
  Type         = {fg = colors.yellow, bg = colors.background},
  Structure    = {fg = colors.orange, bg = colors.background},
  Typedef      = {fg = colors.yellow, bg = colors.background},

  Special      = {fg = colors.orange,   bg = colors.background},
  SpecialChar  = {fg = colors.purple,   bg = colors.background},
  Tag          = {fg = colors.yellow,   bg = colors.background},
  SpecialComment = {fg = colors.purple, bg = colors.background},
  Delimiter    = {fg = colors.khaki,    bg = colors.background},
  Debug        = {fg = colors.red,      bg = colors.background},

  Underlined   = {fg = colors.red,   bg = colors.background},
  Ignore       = {fg = colors.green, bg = colors.background},
  Todo         = {fg = colors.red,   bg = colors.background, bold = true},
  Error        = {fg = colors.red,   bg = colors.background, bold = true}
}

local editor_syntax = {
  Normal       = {fg = colors.white,  bg = colors.background},
  ErrorMsg     = {fg = colors.red,    bg = colors.background},
  Search       = {fg = colors.red,    bg = colors.background},
  IncSearch    = {fg = colors.red,    bg = colors.background, reverse = true},
  DiffText     = {fg = colors.yellow, bg = colors.black, bold = true},
  SignColumn   = {fg = colors.orange, bg = colors.background},
  SpellBad     = {fg = colors.white,  bg = colors.background, undercurl = true},
  SpellCap     = {fg = colors.white,  bg = colors.background},
  SpellRare    = {fg = colors.red,    bg = colors.background},
  Pmenu        = {fg = colors.white,  bg = colors.black},
  PmenuSel     = {fg = colors.orange, bg = colors.background},
  PmenuThumb   = {fg = colors.red,    bg = colors.background},
  PmenuSbar    = {fg = colors.aqua,   bg = colors.background},
  MatchParen   = {fg = colors.red},
  CursorLineNr = {fg = colors.orange, bg = colors.background},
  CursorLine   = {bg = colors.divisor},
  TabLineSel   = {fg = colors.orange, bg = colors.background},
  TabLineFill  = {bg = colors.background},
  TabLine      = {bg = colors.divisor},
  Title        = {fg = colors.white,   bg = colors.divisor},
  VertSplit    = {fg = colors.divisor, bg = colors.background},
  SpecialKey   = {fg = colors.yellow,  bg = colors.background},
  Visual       = {bg = colors.visual},
  LineNr       = {fg = colors.grey, bg = colors.background},
  Directory    = {fg = colors.green},
  FoldColumn   = {fg = colors.yellow, bg = colors.background},
  DiffAdd      = {fg = colors.green,  bg = colors.black, bold = true},
  DiffDelete   = {fg = colors.red,    bg = colors.black, bold = true},
  DiffChange   = {fg = colors.yellow, bg = colors.black, bold = true},
  Folded       = {fg = colors.grey,   bg = colors.background},
  WarningMsg   = {fg = colors.green,  bg = colors.background},
  diffAdded    = {fg = colors.orange, bg = colors.background},
  diffCommon   = {fg = colors.green,  bg = colors.background},
  NonText      = {fg = colors.grey}
}

local meta_syntax = {
  -- Question     = {fg = colors.red, bg = colors.background},
  -- StatusLineNc = {fg = colors.divisor, bg = colors.background},
  -- WildMenu     = {fg = colors.grey, bg = colors.background},
}

local plugin_syntax = {
  -- TreeSitter
  ["@symbol"]                = {fg = colors.cyan,   bg = colors.brackground},
  ["@variable"]              = {fg = colors.white,  bg = colors.brackground},
  ["@variable.builtin"]      = {fg = colors.aqua,   bg = colors.brackground},
  ["@function"]              = {fg = colors.green,  bg = colors.brackground},
  ["@function.call"]         = {fg = colors.green,  bg = colors.brackground},
  ["@function.builtin"]      = {fg = colors.green,  bg = colors.brackground},
  ["@function.macro"]        = {fg = colors.green,  bg = colors.brackground},
  ["@method"]                = {fg = colors.green,  bg = colors.brackground},
  ["@method.call"]           = {fg = colors.green,  bg = colors.brackground},
  ["@keyword"]               = {fg = colors.orange, bg = colors.brackground},
  ["@keyword.function"]      = {fg = colors.orange, bg = colors.brackground},
  ["@keyword.operator"]      = {fg = colors.orange, bg = colors.brackground},
  ["@keyword.return"]        = {fg = colors.red,    bg = colors.brackground},
  ["@constant"]              = {fg = colors.cyan,   bg = colors.brackground},
  ["@constant.macro"]        = {fg = colors.cyan,   bg = colors.brackground},
  ["@constant.builtin"]      = {fg = colors.purple, bg = colors.brackground},
  ["@comment"]               = {fg = colors.grey,   bg = colors.brackground},
  ["@string"]                = {fg = colors.viridian, bg = colors.brackground},
  ["@string.regex"]          = {fg = colors.purple, bg = colors.brackground},
  ["@string.escape"]         = {fg = colors.purple, bg = colors.brackground},
  ["@string.special"]        = {fg = colors.purple, bg = colors.brackground},
  ["@constructor"]           = {fg = colors.forest,   bg = colors.brackground},
  ["@parameter"]             = {fg = colors.cyan,   bg = colors.brackground},
  ["@field"]                 = {fg = colors.cyan,   bg = colors.brackground},
  ["@operator"]              = {fg = colors.khaki,  bg = colors.brackground},
  ["@property"]              = {fg = colors.cyan,   bg = colors.brackground},
  ["@macro"]                 = {fg = colors.orange, bg = colors.brackground},
  ["@preproc"]               = {fg = colors.blue,   bg = colors.brackground},
  ["@define"]                = {fg = colors.blue,   bg = colors.brackground},
  ["@include"]               = {fg = colors.blue,   bg = colors.brackground},
  ["@debug"]                 = {fg = colors.aqua,   bg = colors.brackground},
  ["@namespace"]             = {fg = colors.white,  bg = colors.brackground},
  ["@tag"]                   = {fg = colors.aqua,   bg = colors.brackground},
  ["@tag.delimiter"]         = {fg = colors.aqua,   bg = colors.brackground},
  ["@tag.attribute"]         = {fg = colors.aqua,   bg = colors.brackground},
  ["@punctuation.delimiter"] = {fg = colors.khaki,  bg = colors.brackground},
  ["@punctuation.bracket"]   = {fg = colors.khaki,  bg = colors.brackground},
  ["@punctuation.special"]   = {fg = colors.green,  bg = colors.brackground},
  -- ["@type"]                  = {fg = colors.yellow, bg = colors.brackground},
  ["@type"]                  = {fg = colors.yellow, bg = colors.brackground},
  ["@type.builtin"]          = {fg = colors.yellow, bg = colors.brackground},
  ["@type.definition"]       = {fg = colors.yellow, bg = colors.brackground},
  ["@type.qualifier"]        = {fg = colors.orange, bg = colors.brackground},

  -- Cmp
  CmpItemMenuDefault = {fg = colors.red,   bg = colors.black},
  CmpItemAbbrDefault = {fg = colors.white, bg = colors.black},
  CmpItemAbbrMatch   = {fg = colors.white, bg = colors.black, bold = true},
  CmpItemKindDefault = {fg = colors.red,   bg = colors.black},

  -- LSP diagnostics
  DiagnosticError = {fg = colors.red,    bg = colors.background},
  DiagnosticInfo  = {fg = colors.blue,   bg = colors.background},
  DiagnosticWarn  = {fg = colors.yellow, bg = colors.background},

  -- Git gutter
  GitGutterDelete = {fg = colors.red,    bg = colors.background},
  GitGutterAdd    = {fg = colors.green,  bg = colors.background},
  GitGutterChange = {fg = colors.yellow, bg = colors.background},

  -- TreeSitter Context
  TreesitterContext           = {fg = colors.white,  bg = colors.background},
  TreesitterContextLineNumber = {fg = colors.orange, bg = colors.brackground},

  -- NvimTree
  NvimTreeStatusLine       = {fg = colors.background, bg = colors.background},
  NvimTreeStatusLineNc     = {fg = colors.background, bg = colors.background},
  NvimTreeIndentMarker     = {fg = colors.visual,     bg = colors.brackground},
  NvimTreeWindowPicker     = {fg = colors.white,      bg = colors.blue},
  NvimTreeOpenedFolderIcon = {fg = colors.orange},
  NvimTreeClosedFolderIcon = {fg = colors.orange},

  -- Indent-blank-line
  IndentBlankLineChar               = {fg = colors.divisor},
  IndentBlankLineSpaceChar          = {fg = colors.divisor},
  IndentBlankLineSpaceCharBlankLine = {fg = colors.divisor},

  -- DevIcon
  DevIconPy  = {fg = colors.yellow},
  DevIconRs  = {fg = colors.orange},
  DevIconC   = {fg = colors.blue},
  DevIconCpp = {fg = colors.forest},
  DevIconLua = {fg = colors.blue},
  DevIconRb  = {fg = colors.red},
  DevIconTxt = {fg = colors.green},
  DevIconMd  = {fg = colors.khaki},
  DevIconH   = {fg = colors.purple}
}

function M.setup()

  for group, opts in pairs(code_syntax) do
    highlight(group, opts)
  end

  for group, opts in pairs(plugin_syntax) do
    highlight(group, opts)
  end

  for group, opts in pairs(editor_syntax) do
    highlight(group, opts)
  end

  for group, opts in pairs(meta_syntax) do
    highlight(group, opts)
  end

end

function M.get_colors()
  return colors
end

return M
