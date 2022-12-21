local nnoremap = require("bruno.keymap").nnoremap
local vnoremap = require("bruno.keymap").vnoremap
local tnoremap = require("bruno.keymap").tnoremap

-- Refresh ctags
nnoremap("<leader>c", ":! ctags -R . <CR>")

-- Split movement
nnoremap("<C-h>", "<C-w>h")
nnoremap("<C-j>", "<C-w>j")
nnoremap("<C-k>", "<C-w>k")
nnoremap("<C-l>", "<C-w>l")
nnoremap("<C-q>", "<C-w>q")
nnoremap("<C-o>", "<C-w>o")

-- Tab movement
nnoremap("<", ":tabp<CR>")
nnoremap(">", ":tabn<CR>")

-- Lazy saving/quitting
nnoremap("<leader>w", ":w<CR>")
nnoremap("<leader>q", ":q<CR>")
nnoremap("<leader>Q", ":q!<CR>")

-- Overide shenanigans
nnoremap("<leader>rw", "cw<C-r>0<C-c>")
vnoremap("p", '"_dP')

-- Terminal split
nnoremap("<leader>T", ":120vsplit term:// bash <CR>i")
tnoremap("<leader><Esc>", "<C-\\><C-n>")

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
nnoremap("<leader>fb", ":Telescope buffers <CR>")
nnoremap("<leader>fw", function ()
  require("telescope.builtin").grep_string({ search = vim.fn.input("Grep >")});
end)

nnoremap("<leader>lg", ":Telescope live_grep <CR>")
nnoremap("<leader>hl", ":Telescope highlights <CR>")
nnoremap("<leader>t", ":NvimTreeToggle<CR>")
nnoremap("<leader>F", ":NvimTreeFindFile<CR>")
nnoremap("<leader>R", ":NvimTreeRefresh<CR>")
nnoremap("<leader>gb", ":Git blame <CR>")
nnoremap("<leader>do", ":DiffviewOpen <CR>")
nnoremap("<leader>dh", ":DiffviewFileHistory <CR>")
nnoremap("<leader>dt", ":diffthis <CR>")
