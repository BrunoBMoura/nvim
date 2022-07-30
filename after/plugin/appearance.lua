local napolitan_colors = {
    background  = "234",
    divisor     = "235",
    delimiter   = "180",
    grey        = "240",
    dark_grey   = "181",
    visual      = "236",
    string      = "151",
    aqua        = "079",
    green       = "144",
    blue        = "067",
    red         = "088",
    orange      = "173",
    purple      = "103",
    pink        = "167",
    yellow      = "215",
    cyan        = "152",
    black       = "233",
    white       = "230"
}

local function term_highlight(group, opts)
    opts = opts or {}
    vim.api.nvim_set_hl(0, group, opts)
end

-- term_highlight("Normal", {ctermfg = napolitan_colors.white})


