require("bruno.statusline").setup()
require("bruno.tabline").setup()
require("bruno.napolitan").setup()
local colors = require("bruno.napolitan").get_colors()

local function set_hl_table(tbl)
  for group, opts in pairs(tbl) do
    vim.api.nvim_set_hl(0, group, opts)
  end
end

--[[ local function invert_bg_fg(tbl)
  for _, info in pairs(tbl) do
    info.bg = info.fg
    info.fg = colors.visual
  end
  tbl.StatusLineFiller.fg = colors.visual
end
 ]]

-- Definition required by statusline
local mode_group_colors = {
  StatusLineNormalColor   = {fg = colors.pink, bg = colors.none, bold = true},
  StatusLineVisualColor   = {fg = colors.magenta, bg = colors.none, bold = true},
  StatusLineInsertColor   = {fg = colors.green, bg = colors.none, bold = true},
  StatusLineSelectColor   = {fg = colors.cyan, bg = colors.none, bold = true},
  StatusLineReplaceColor  = {fg = colors.yellow, bg = colors.none, bold = true},
  StatusLineQfColor       = {fg = colors.purple, bg = colors.none, bold = true},
  StatusLineShellColor    = {fg = colors.aqua, bg = colors.none, bold = true},
  StatusLineTerminalColor = {fg = colors.blue, bg = colors.none, bold = true},
  StatusLineFileName      = {fg = colors.cyan, bg = colors.none, bold = true},
  StatusLineFiller        = {fg = colors.visual, bg = colors.none},
}

-- invert_bg_fg(mode_group_colors)
set_hl_table(mode_group_colors)
