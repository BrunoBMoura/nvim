vim.cmd("colorscheme gruvbox")

vim.opt.cursorline = true
vim.opt.laststatus = 3
vim.opt.showtabline = 3
vim.opt.background = "dark"
vim.opt.list = true
vim.opt.fillchars = {
    stl = "―",
    fold = "۰",
    diff = "·"
}

vim.opt.listchars = {
    tab = "»·",
    trail = "·",
    eol = "¬"
}

--[[
local napolitan_colors = {
    background  = "#1C1C1C", -- 234
    divisor     = "#262626", -- 235
    delimiter   = "#d7af87", -- 180
    grey        = "#585858", -- 240
    dark_grey   = "#D7AF87", -- 181
    visual      = "#303030", -- 236
    string      = "#AFD7AF", -- 151
    aqua        = "#5FD7AF", -- 079
    green       = "#AFAF87", -- 144
    blue        = "#5F87AF", -- 067
    red         = "#870000", -- 088
    orange      = "#D7875F", -- 173
    purple      = "#8787AF", -- 103
    pink        = "#D75F5F", -- 167
    yellow      = "#FFAF5F", -- 215
    cyan        = "#AFD7D7", -- 152
    black       = "#121212", -- 233
    white       = "#FFFFD7", -- 230
    none        = "NONE"
}

local function hl(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
end
--]]
