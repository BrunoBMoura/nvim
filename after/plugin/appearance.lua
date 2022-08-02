local napolitan = require("bruno.napolitan").setup()

for group, opts in pairs(napolitan.colorscheme) do
  vim.api.nvim_set_hl(0, group, opts)
end

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

for group, opts in pairs(mode_group_colors) do
  vim.api.nvim_set_hl(0, group, opts)
end

Statusline = require("bruno.statusline").setup()
vim.api.nvim_create_autocmd({"ModeChanged"}, {
  command = "setlocal statusline=%!v:lua.Statusline.refresh()",
})

vim.api.nvim_create_autocmd({"BufEnter"}, {
  command = "setlocal statusline=%!v:lua.Statusline.refresh()",
})

