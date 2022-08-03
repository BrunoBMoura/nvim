require("bruno.statusline").setup()
-- require("bruno.tabline").setup()
local napolitan = require("bruno.napolitan").setup()

-- Definition required by statusline
local mode_group_colors = {
  StatusLineNormalColor = {fg = napolitan.colors.orange, bg = napolitan.colors.none},
  StatusLineVisualColor = {fg = napolitan.colors.pink, bg = napolitan.colors.none},
  StatusLineInsertColor = {fg = napolitan.colors.green, bg = napolitan.colors.none},
  StatusLineSelectColor = {fg = napolitan.colors.cyan, bg = napolitan.colors.none},
  StatusLineReplaceColor = {fg = napolitan.colors.yellow, bg = napolitan.colors.none},
  StatusLineShellColor = {fg = napolitan.colors.aqua, bg = napolitan.colors.none},
  StatusLineTerminalColor = {fg = napolitan.colors.blue, bg = napolitan.colors.none},
}

local function set_hl(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

for group, opts in pairs(napolitan.colorscheme) do
  set_hl(group, opts)
end

for group, opts in pairs(mode_group_colors) do
  set_hl(group, opts)
end

