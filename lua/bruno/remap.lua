local nnoremap = require("bruno.keymap").nnoremap
local vnoremap = require("bruno.keymap").vnoremap

nnoremap("<leader>E", "<cmd>Ex<CR>")
-- Split movement
nnoremap("<C-h>",     "<C-w>h")
nnoremap("<C-j>",     "<C-w>j")
nnoremap("<C-k>",     "<C-w>k")
nnoremap("<C-l>",     "<C-w>l")
-- Tab movement
nnoremap("<",         "tabp<CR>")
nnoremap(">",         "tabn<CR>")
-- Lazy saving/quitting
nnoremap("<leader>w", ":w<CR>")
nnoremap("<leader>q", ":q<CR>")
nnoremap("<leader>Q", ":q!<CR>")
-- Overide shenanigans
nnoremap("<leader>rw", "cw<C-r>0<C-c>")
-- Terminal split
nnoremap("<leader>T", ":vsplit term:// bash <CR>i")
-- Visual mode identation
vnoremap("<Tab>",   ">gv")
vnoremap("<S-Tab>", "<gv")
-- Visual mode line movement
vnoremap("J", ":m '>+1'<CR>gv=gv")
vnoremap("K", ":m '<-2'<CR>gv=gv")



