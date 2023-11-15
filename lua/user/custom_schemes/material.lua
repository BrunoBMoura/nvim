local material = require("material")

vim.g.material_style = "darker"

local colors = require("material.colors")

material.setup({
  styles = {
    comments = { italic = false },
    strings = { bold = false },
    keywords = { bold = false },
  },
  custom_highlights = {
    TelescopeBorder            = { link = "LineNr" },
    ["@keyword"]               = { fg = colors.main.darkorange},
    ["@label"]                 = { fg = colors.main.paleblue},
    ["@punctuation"]           = { fg = colors.main.gray},
    ["@punctuation.delimiter"] = { fg = colors.main.gray},
    NvimTreeIndentMarker       = { fg = colors.editor.comments },
    MatchParen                 = { fg = colors.main.orange, bold = false },
    Macro                      = { fg = colors.main.cyan },
    String                     = { fg = colors.main.darkgreen},
    Operator                   = { fg = colors.main.darkred},
  },
  custom_colors = function(colors)
    colors.main.orange = colors.main.darkorange
    colors.main.yellow = colors.main.darkyellow
    colors.main.green  = colors.main.darkgreen
    colors.main.blue   = colors.main.darkblue
    colors.main.cyan   = colors.main.darkcyan
    colors.main.purple = colors.main.darkpurple
    colors.main.orange = colors.main.darkorange
    colors.main.red    = colors.main.darkred
  end
})

vim.cmd("colorscheme material")

local tabline_colors = {
  icon         = { fg = colors.main.orange, bold = false },
  separator    = { fg = colors.main.yellow,  bold = true },
  active_tab   = { fg = colors.main.white,    bold = true },
  inactive_tab = { fg = colors.main.gray,     bold = false }
}

--  opa
local statusline_colors = {
  normal      = { fg = colors.main.orange, bold = true },
  visual      = { fg = colors.main.red,    bold = true },
  insert      = { fg = colors.main.darkgreen,  bold = true },
  select      = { fg = colors.main.purple, bold = true },
  replace     = { fg = colors.main.yellow, bold = true },
  quickfix    = { fg = colors.main.orange, bold = true },
  shell       = { fg = colors.main.green,   bold = true },
  terminal    = { fg = colors.main.blue,   bold = true },
  confirm     = { fg = colors.main.cyan,   bold = true },
  file_name   = { fg = colors.syntax.comments, bold = true },
  line_filler = { fg = colors.syntax.comments, bold = false },
}

return {
  tabline_colors = tabline_colors,
  statusline_colors = statusline_colors
}
