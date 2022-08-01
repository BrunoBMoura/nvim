local nnoremap = require("bruno.keymap").nnoremap
local vnoremap = require("bruno.keymap").vnoremap

nnoremap("<leader>E", "<cmd>Ex<CR>")
-- Split movement
nnoremap("<C-h>",     "<C-w>h")
nnoremap("<C-j>",     "<C-w>j")
nnoremap("<C-k>",     "<C-w>k")
nnoremap("<C-l>",     "<C-w>l")
nnoremap("<C-q>",     "<C-w>q")
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
-- Split/window resizing
nnoremap("<C-Down>", ":resize -2 <CR>")
nnoremap("<C-Up>", ":resize +2 <CR>")
nnoremap("<C-Left>", ":vertical resize -2 <CR>")
nnoremap("<C-Right>", ":vertical resize +2 <CR>")

-- Plugin binds
nnoremap("<leader>ff", ":Telescope find_files <CR>")
nnoremap("<leader>ft", ":Telescope live_grep <CR>")
nnoremap("<leader>fb", ":Telescope buffers <CR>")
nnoremap("<leader>hl", ":Telescope highlights <CR>")
nnoremap("<leader>t", ":NERDTreeToggle<CR>")
nnoremap("<leader>F", ":NERDTreeFind<CR>")
nnoremap("<leader>R", ":NERDTreeRefresRoot<CR>")
nnoremap("<leader>gb", ":Git blame <CR>")

