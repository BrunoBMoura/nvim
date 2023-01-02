local M = {}

local function highlight(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

local colors = {
  background      = "#1A1A1A",
  divisor         = "#262626",
  delimiter       = "#D7AF87",
  visual          = "#303030",
  grey            = "#585858",
  pastel          = "#D7AFAF",
  aqua            = "#87D7AF",
  green           = "#AFAF87",
  blue            = "#4B878E",
  red             = "#D75F5F",
  orange          = "#E8946A",
  purple          = "#8787AF",
  yellow          = "#F3E295",
  pink            = "#DF7C7C",
  cyan            = "#BCDCC9",
  black           = "#121212",
  white           = "#FFFFD7",
  dark_green      = "#1A1900",
  dark_red        = "#420000",
  dark_orange     = "#461100",
}

local code_syntax = {
  Comment      = {fg = colors.grey},
  Constant     = {fg = colors.pastel},
  String       = {fg = colors.cyan},
  Character    = {fg = colors.cyan},
  Number       = {fg = colors.purple},
  Float        = {fg = colors.purple},
  Boolean      = {fg = colors.purple},

  Identifier   = {fg = colors.pastel},
  Function     = {fg = colors.green},

  Keyword      = {fg = colors.orange},
  Statement    = {fg = colors.orange},
  Conditional  = {fg = colors.orange},
  Repeat       = {fg = colors.orange},
  Label        = {fg = colors.pastel},
  Operator     = {fg = colors.aqua},
  Exception    = {fg = colors.red},

  PreProc      = {fg = colors.purple},
  Include      = {fg = colors.blue},
  Define       = {fg = colors.blue},
  PreCondit    = {fg = colors.red},
  Macro        = {fg = colors.orange},

  StorageClass = {fg = colors.pink},
  Type         = {fg = colors.yellow},
  Structure    = {fg = colors.red},
  Typedef      = {fg = colors.orange},

  Special      = {fg = colors.red},
  SpecialChar  = {fg = colors.purple},
  Tag          = {fg = colors.yellow},
  SpecialComment = {fg = colors.purple},
  Delimiter    = {fg = colors.orange},
  Debug        = {fg = colors.red},

  Underlined   = {fg = colors.red},
  Ignore       = {fg = colors.green},
  Todo         = {fg = colors.red, bold = true},
  Error        = {fg = colors.red, bold = true}
}

local editor_syntax = {
  Normal       = {fg = colors.white},
  ErrorMsg     = {fg = colors.red},
  Search       = {fg = colors.red},
  IncSearch    = {fg = colors.red, reverse = true},
  DiffText     = {fg = colors.yellow, bg = colors.dark_orange, bold = true},
  SignColumn   = {fg = colors.orange},
  SpellBad     = {fg = colors.white, undercurl = true},
  SpellCap     = {fg = colors.white},
  SpellRare    = {fg = colors.red},
  Pmenu        = {fg = colors.white, bg = colors.black},
  PmenuSel     = {fg = colors.orange},
  PmenuThumb   = {fg = colors.red},
  PmenuSbar    = {fg = colors.aqua},
  MatchParen   = {fg = colors.red},
  CursorLineNr = {fg = colors.orange},
  CursorLine   = {bg = colors.divisor},
  TabLineSel   = {fg = colors.orange},
  TabLineFill  = {bg = colors.divisor},
  TabLine      = {bg = colors.divisor},
  Title        = {fg = colors.white, bg = colors.divisor},
  VertSplit    = {fg = colors.divisor},
  SpecialKey   = {fg = colors.yellow},
  Visual       = {bg = colors.visual},
  LineNr       = {fg = colors.grey},
  Directory    = {fg = colors.green},
  FoldColumn   = {fg = colors.yellow},
  DiffAdd      = {fg = colors.green, bg = colors.dark_green, bold = true},
  DiffDelete   = {fg = colors.red, bg = colors.dark_red, bold = true},
  DiffChange   = {fg = colors.yellow, bg = colors.dark_orange, bold = true},
  Folded       = {fg = colors.grey},
  WarningMsg   = {fg = colors.green},
}

local meta_syntax = {
  NonText      = {fg = colors.grey},
  Question     = {fg = colors.red},
  StatusLineNc = {fg = colors.divisor},
  WildMenu     = {fg = colors.grey},
  diffAdded      = {fg = colors.delimiter},
  diffCommon     = {fg = colors.green},
}

local plugin_syntax = {
  -- TreeSitter
  ["@symbol"]           = {fg = colors.pastel},
  ["@variable"]         = {fg = colors.white},
  ["@variable.builtin"] = {fg = colors.aqua},
  ["@function"]         = {fg = colors.green},
  ["@function.call"]    = {fg = colors.green},
  ["@function.builtin"] = {fg = colors.green},
  ["@function.macro"]   = {fg = colors.pink},
  ["@method"]           = {fg = colors.green},
  ["@method.call"]      = {fg = colors.green},
  ["@keyword"]          = {fg = colors.orange},
  ["@keyword.function"] = {fg = colors.orange},
  ["@keyword.operator"] = {fg = colors.aqua},
  ["@keyword.return"]   = {fg = colors.red},
  ["@constant"]         = {fg = colors.pastel},
  ["@constant.macro"]   = {fg = colors.orange},
  ["@constant.builtin"] = {fg = colors.blue},
  ["@comment"]          = {fg = colors.grey},
  ["@string"]           = {fg = colors.cyan},
  ["@string.regex"]     = {fg = colors.purple},
  ["@string.escape"]    = {fg = colors.purple},
  ["@string.special"]   = {fg = colors.purple},
  ["@constructor"]      = {fg = colors.blue},
  ["@parameter"]        = {fg = colors.pastel},
  ["@field"]            = {fg = colors.pastel},
  ["@operator"]         = {fg = colors.aqua},
  ["@property"]         = {fg = colors.pastel},
  ["@macro"]            = {fg = colors.orange},
  ["@preproc"]          = {fg = colors.red},
  ["@define"]           = {fg = colors.blue},
  ["@include"]          = {fg = colors.blue},
  ["@debug"]            = {fg = colors.aqua},
  ["@namespace"]        = {fg = colors.cyan},
  ["@tag"]              = {fg = colors.aqua},
  ["@tag.delimiter"]    = {fg = colors.aqua},
  ["@tag.attribute"]    = {fg = colors.aqua},
  ["@punctuation.delimiter"] = {fg = colors.delimiter},
  ["@punctuation.bracket"]   = {fg = colors.delimiter},
  ["@punctuation.special"]   = {fg = colors.red},
  ["@type"]             = {fg = colors.yellow},
  ["@type.builtin"]     = {fg = colors.yellow},
  ["@type.definition"]  = {fg = colors.blue},
  ["@type.qualifier"]   = {fg = colors.red},

  -- Cmp
  CmpItemMenuDefault = {fg = colors.red, bg = colors.black},
  CmpItemAbbrDefault = {fg = colors.white, bg = colors.black},
  CmpItemAbbrMatch   = {fg = colors.white, bg = colors.black, bold = true},
  CmpItemKindDefault = {fg = colors.red, bg = colors.black},

  -- LSP diagnostics
  DiagnosticError = {fg = colors.red, bg = colors.background},
  DiagnosticInfo  = {fg = colors.blue, bg = colors.background},
  DiagnosticWarn  = {fg = colors.yellow, bg = colors.background},

  -- Git gutter
  GitGutterDelete = {fg = colors.red, bg = colors.background},
  GitGutterAdd    = {fg = colors.green, bg = colors.background},
  GitGutterChange = {fg = colors.yellow, bg = colors.background},

  -- TreeSitter Context
  TreesitterContext           = {fg = colors.white, bg = colors.background},
  TreesitterContextLineNumber = {fg = colors.orange},

  -- NvimTree
  NvimTreeStatusLine   = {fg = colors.background, bg = colors.background},
  NvimTreeStatusLineNc = {fg = colors.background, bg = colors.background},
  NvimTreeIndentMarker = {fg = colors.visual},
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

  vim.api.nvim_set_var("terminal_color_0",          colors.background)
  vim.api.nvim_set_var("terminal_color_1",          colors.red)
  vim.api.nvim_set_var("terminal_color_2",          colors.green)
  vim.api.nvim_set_var("terminal_color_3",          colors.yellow)
  vim.api.nvim_set_var("terminal_color_4",          colors.blue)
  vim.api.nvim_set_var("terminal_color_5",          colors.purple)
  vim.api.nvim_set_var("terminal_color_6",          colors.cyan)
  vim.api.nvim_set_var("terminal_color_7",          colors.fg)
  vim.api.nvim_set_var("terminal_color_8",          colors.grey)
  vim.api.nvim_set_var("terminal_color_9",          colors.red)
  vim.api.nvim_set_var("terminal_color_10",         colors.green)
  vim.api.nvim_set_var("terminal_color_11",         colors.orange)
  vim.api.nvim_set_var("terminal_color_12",         colors.blue)
  vim.api.nvim_set_var("terminal_color_13",         colors.purple)
  vim.api.nvim_set_var("terminal_color_14",         colors.cyan)
  vim.api.nvim_set_var("terminal_color_15",         colors.white)
  vim.api.nvim_set_var("terminal_color_background", colors.background)
  vim.api.nvim_set_var("terminal_color_foreground", colors.white)

end

function M.get_colors()
  return colors
end

return M
