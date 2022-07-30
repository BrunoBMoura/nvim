require("bruno.set")
require("bruno.remap")

local augroup = vim.api.nvim_create_augroup
bruno_group = augroup("Bruno", {})

local autocmd = vim.api.nvim_create_autocmd

autocmd({"BufWritePre"}, {
    group = bruno_group,
    pattern = "*",
    command = "%s/\\s\\+$//e",
})

