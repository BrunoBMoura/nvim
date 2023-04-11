local M = {}

local function highlight(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

local colors = {
  night_sky       = "#1D1C19",
  rainy           = "#262626",
  jet             = "#303030",
  cloudy          = "#585858",
  khaki           = "#C3AA97",
  white           = "#DED3B1",
  cyan            = "#99A59D",
  blue            = "#4B878E",
  aqua            = "#83BAA5",
  viridian        = "#618E82",
  green           = "#BDBB89",
  forest          = "#779576",
  red             = "#D75F5F",
  orange          = "#D87C6C",
  yellow          = "#D19F77",
  purple          = "#B78C99",
  pink            = "#DF7C7C",
  black           = "#171717",
}

local code_syntax = {
  Comment      = {fg = colors.cloudy,   bg = colors.night_sky},
  Constant     = {fg = colors.cyan,     bg = colors.night_sky},
  String       = {fg = colors.viridian, bg = colors.night_sky},
  Character    = {fg = colors.viridian, bg = colors.night_sky},
  Number       = {fg = colors.purple},
  Float        = {fg = colors.purple},
  Boolean      = {fg = colors.purple},

  Identifier   = {fg = colors.white,  bg = colors.night_sky},
  Function     = {fg = colors.green,  bg = colors.night_sky},

  Keyword      = {fg = colors.orange, bg = colors.night_sky},
  Statement    = {fg = colors.orange, bg = colors.night_sky},
  Conditional  = {fg = colors.orange},
  Repeat       = {fg = colors.orange},
  Label        = {fg = colors.cyan},
  Operator     = {fg = colors.khaki,  bg = colors.night_sky},
  Exception    = {fg = colors.red},

  PreProc      = {fg = colors.purple, bg = colors.night_sky},
  Include      = {fg = colors.blue,   bg = colors.night_sky},
  Define       = {fg = colors.blue,   bg = colors.night_sky},
  PreCondit    = {fg = colors.blue,   bg = colors.night_sky},
  Macro        = {fg = colors.purple, bg = colors.night_sky},

  StorageClass = {fg = colors.pink,   bg = colors.night_sky},
  Type         = {fg = colors.yellow, bg = colors.night_sky},
  Structure    = {fg = colors.orange, bg = colors.night_sky},
  Typedef      = {fg = colors.yellow, bg = colors.night_sky},

  Special        = {fg = colors.orange,   bg = colors.night_sky},
  SpecialChar    = {fg = colors.purple,   bg = colors.night_sky},
  Tag            = {fg = colors.yellow,   bg = colors.night_sky},
  SpecialComment = {fg = colors.purple,   bg = colors.night_sky},
  Delimiter      = {fg = colors.khaki,    bg = colors.night_sky},
  Debug          = {fg = colors.red,      bg = colors.night_sky},

  Underlined   = {fg = colors.red,   bg = colors.night_sky},
  Ignore       = {fg = colors.green, bg = colors.night_sky},
  Todo         = {fg = colors.red,   bg = colors.night_sky, bold = true},
  Error        = {fg = colors.red,   bg = colors.night_sky, bold = true}
}

local editor_syntax = {
  Normal       = {fg = colors.white,  bg = colors.night_sky},
  ErrorMsg     = {fg = colors.red,    bg = colors.night_sky},
  Search       = {fg = colors.red,    bg = colors.night_sky},
  IncSearch    = {fg = colors.red,    bg = colors.night_sky, reverse = true},
  DiffText     = {fg = colors.yellow, bg = colors.black, bold = true},
  SignColumn   = {fg = colors.orange, bg = colors.night_sky},
  SpellBad     = {fg = colors.white,  bg = colors.night_sky, undercurl = true},
  SpellCap     = {fg = colors.white,  bg = colors.night_sky},
  SpellRare    = {fg = colors.red,    bg = colors.night_sky},
  Pmenu        = {fg = colors.white,  bg = colors.black},
  PmenuSel     = {fg = colors.orange, bg = colors.night_sky},
  PmenuThumb   = {fg = colors.red,    bg = colors.night_sky},
  PmenuSbar    = {fg = colors.aqua,   bg = colors.night_sky},
  MatchParen   = {fg = colors.red},
  CursorLineNr = {fg = colors.orange, bg = colors.night_sky},
  CursorLine   = {bg = colors.rainy},
  TabLineSel   = {fg = colors.orange, bg = colors.night_sky},
  TabLineFill  = {bg = colors.night_sky},
  TabLine      = {bg = colors.rainy},
  Title        = {fg = colors.white,  bg = colors.rainy},
  VertSplit    = {fg = colors.rainy,  bg = colors.night_sky},
  SpecialKey   = {fg = colors.yellow, bg = colors.night_sky},
  Visual       = {bg = colors.jet},
  LineNr       = {fg = colors.cloudy, bg = colors.night_sky},
  Directory    = {fg = colors.green},
  FoldColumn   = {fg = colors.yellow, bg = colors.night_sky},
  DiffAdd      = {fg = colors.green,  bg = colors.black, bold = true},
  DiffDelete   = {fg = colors.red,    bg = colors.black, bold = true},
  DiffChange   = {fg = colors.yellow, bg = colors.black, bold = true},
  Folded       = {fg = colors.cloudy, bg = colors.night_sky},
  WarningMsg   = {fg = colors.green,  bg = colors.night_sky},
  diffAdded    = {fg = colors.orange, bg = colors.night_sky},
  diffCommon   = {fg = colors.green,  bg = colors.night_sky},
  NonText      = {fg = colors.cloudy}
}

local meta_syntax = {
  -- Question     = {fg = colors.red, bg = colors.night_sky},
  -- StatusLineNc = {fg = colors.rainy, bg = colors.night_sky},
  -- WildMenu     = {fg = colors.cloudy, bg = colors.night_sky},
}

local plugin_syntax = {
  -- TreeSitter
  ["@symbol"]                = {fg = colors.cyan,     bg = colors.brackground},
  ["@variable"]              = {fg = colors.white,    bg = colors.brackground},
  ["@variable.builtin"]      = {fg = colors.aqua,     bg = colors.brackground},
  ["@function"]              = {fg = colors.green,    bg = colors.brackground},
  ["@function.call"]         = {fg = colors.green,    bg = colors.brackground},
  ["@function.builtin"]      = {fg = colors.green,    bg = colors.brackground},
  ["@function.macro"]        = {fg = colors.green,    bg = colors.brackground},
  ["@method"]                = {fg = colors.green,    bg = colors.brackground},
  ["@method.call"]           = {fg = colors.green,    bg = colors.brackground},
  ["@keyword"]               = {fg = colors.orange,   bg = colors.brackground},
  ["@keyword.function"]      = {fg = colors.orange,   bg = colors.brackground},
  ["@keyword.operator"]      = {fg = colors.orange,   bg = colors.brackground},
  ["@keyword.return"]        = {fg = colors.red,      bg = colors.brackground},
  ["@constant"]              = {fg = colors.cyan,     bg = colors.brackground},
  ["@constant.macro"]        = {fg = colors.cyan,     bg = colors.brackground},
  ["@constant.builtin"]      = {fg = colors.purple,   bg = colors.brackground},
  ["@comment"]               = {fg = colors.cloudy,   bg = colors.brackground},
  ["@string"]                = {fg = colors.viridian, bg = colors.brackground},
  ["@string.regex"]          = {fg = colors.purple,   bg = colors.brackground},
  ["@string.escape"]         = {fg = colors.purple,   bg = colors.brackground},
  ["@string.special"]        = {fg = colors.purple,   bg = colors.brackground},
  ["@constructor"]           = {fg = colors.forest,   bg = colors.brackground},
  ["@parameter"]             = {fg = colors.cyan,     bg = colors.brackground},
  ["@field"]                 = {fg = colors.cyan,     bg = colors.brackground},
  ["@operator"]              = {fg = colors.khaki,    bg = colors.brackground},
  ["@property"]              = {fg = colors.cyan,     bg = colors.brackground},
  ["@macro"]                 = {fg = colors.orange,   bg = colors.brackground},
  ["@preproc"]               = {fg = colors.blue,     bg = colors.brackground},
  ["@define"]                = {fg = colors.blue,     bg = colors.brackground},
  ["@include"]               = {fg = colors.blue,     bg = colors.brackground},
  ["@debug"]                 = {fg = colors.aqua,     bg = colors.brackground},
  ["@namespace"]             = {fg = colors.white,    bg = colors.brackground},
  ["@tag"]                   = {fg = colors.aqua,     bg = colors.brackground},
  ["@tag.delimiter"]         = {fg = colors.aqua,     bg = colors.brackground},
  ["@tag.attribute"]         = {fg = colors.aqua,     bg = colors.brackground},
  ["@punctuation.delimiter"] = {fg = colors.khaki,    bg = colors.brackground},
  ["@punctuation.bracket"]   = {fg = colors.khaki,    bg = colors.brackground},
  ["@punctuation.special"]   = {fg = colors.green,    bg = colors.brackground},
  ["@type"]                  = {fg = colors.yellow,   bg = colors.brackground},
  ["@type.builtin"]          = {fg = colors.yellow,   bg = colors.brackground},
  ["@type.definition"]       = {fg = colors.yellow,   bg = colors.brackground},
  ["@type.qualifier"]        = {fg = colors.orange,   bg = colors.brackground},

  -- Cmp
  CmpItemMenuDefault = {fg = colors.red,   bg = colors.black},
  CmpItemAbbrDefault = {fg = colors.white, bg = colors.black},
  CmpItemAbbrMatch   = {fg = colors.white, bg = colors.black, bold = true},
  CmpItemKindDefault = {fg = colors.red,   bg = colors.black},

  -- LSP diagnostics
  DiagnosticError = {fg = colors.red,    bg = colors.night_sky},
  DiagnosticInfo  = {fg = colors.blue,   bg = colors.night_sky},
  DiagnosticWarn  = {fg = colors.yellow, bg = colors.night_sky},

  -- Git gutter
  GitGutterDelete = {fg = colors.red,    bg = colors.night_sky},
  GitGutterAdd    = {fg = colors.green,  bg = colors.night_sky},
  GitGutterChange = {fg = colors.yellow, bg = colors.night_sky},

  -- TreeSitter Context
  TreesitterContext           = {fg = colors.white,  bg = colors.night_sky},
  TreesitterContextLineNumber = {fg = colors.orange, bg = colors.brackground},

  -- NvimTree
  NvimTreeStatusLine       = {fg = colors.night_sky, bg = colors.night_sky},
  NvimTreeStatusLineNc     = {fg = colors.night_sky, bg = colors.night_sky},
  NvimTreeIndentMarker     = {fg = colors.jet,       bg = colors.brackground},
  NvimTreeWindowPicker     = {fg = colors.white,     bg = colors.blue},
  NvimTreeOpenedFolderIcon = {fg = colors.green},
  NvimTreeClosedFolderIcon = {fg = colors.green},

  -- Indent-blank-line
  IndentBlankLineChar               = {fg = colors.rainy},
  IndentBlankLineSpaceChar          = {fg = colors.rainy},
  IndentBlankLineSpaceCharBlankLine = {fg = colors.rainy},

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

function M.pallet()
  return colors
end

return M
