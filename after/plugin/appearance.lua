require("bruno.statusline").setup()
require("bruno.tabline").setup()
local napolitan = require("bruno.napolitan").setup()

local function set_hl_table(tbl)
  for group, opts in pairs(tbl) do
    vim.api.nvim_set_hl(0, group, opts)
  end
end

local function invert_bg_fg(tbl)
  for _, info in pairs(tbl) do
    info.bg = info.fg
    info.fg = napolitan.colors.visual
  end
  tbl.StatusLineFiller.fg = napolitan.colors.visual
end

-- Definition required by statusline
local mode_group_colors = {
  StatusLineNormalColor   = {fg = napolitan.colors.pink, bg = napolitan.colors.none, bold = true},
  StatusLineVisualColor   = {fg = napolitan.colors.magenta, bg = napolitan.colors.none, bold = true},
  StatusLineInsertColor   = {fg = napolitan.colors.green, bg = napolitan.colors.none, bold = true},
  StatusLineSelectColor   = {fg = napolitan.colors.cyan, bg = napolitan.colors.none, bold = true},
  StatusLineReplaceColor  = {fg = napolitan.colors.yellow, bg = napolitan.colors.none, bold = true},
  StatusLineQfColor       = {fg = napolitan.colors.purple, bg = napolitan.colors.none, bold = true},
  StatusLineShellColor    = {fg = napolitan.colors.aqua, bg = napolitan.colors.none, bold = true},
  StatusLineTerminalColor = {fg = napolitan.colors.blue, bg = napolitan.colors.none, bold = true},
  StatusLineFileName      = {fg = napolitan.colors.cyan, bg = napolitan.colors.none, bold = true},
  StatusLineFiller        = {fg = napolitan.colors.visual, bg = napolitan.colors.none},
}

invert_bg_fg(mode_group_colors)



set_hl_table(napolitan.colorscheme)
set_hl_table(mode_group_colors)
