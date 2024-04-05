local default_opts = { noremap = false, silent = true }

-- Refresh ctags
vim.keymap.set("n","<leader>c", ":! ctags -R . <CR>", default_opts)

-- Split movement
vim.keymap.set("n", "<C-h>", "<C-w>h", default_opts)
vim.keymap.set("n", "<C-j>", "<C-w>j", default_opts)
vim.keymap.set("n", "<C-k>", "<C-w>k", default_opts)
vim.keymap.set("n", "<C-l>", "<C-w>l", default_opts)
vim.keymap.set("n", "<C-q>", "<C-w>q", default_opts)

-- Tab movement
vim.keymap.set("n", "<", ":tabp<CR>", default_opts)
vim.keymap.set("n", ">", ":tabn<CR>", default_opts)
vim.keymap.set("n", "<S-l>", ":bnext<CR>", default_opts)
vim.keymap.set("n", "<S-h>", ":bprevious<CR>", default_opts)

-- Lazy movement
vim.keymap.set("n", "<C-d>", "<C-d>zz", default_opts)
vim.keymap.set("n", "<C-u>", "<C-u>zz", default_opts)
vim.keymap.set("n", "<S-u>", "<C-r>", default_opts)

-- Lazy saving/quitting
vim.keymap.set("n", "<leader>w", ":w<CR>", default_opts)
vim.keymap.set("n", "<leader>q", ":q<CR>", default_opts)

-- Overide shenanigans
vim.keymap.set("n", "<leader>rw", "cw<C-r>0<C-c>", default_opts)
vim.keymap.set("v", "p", '"_dP', default_opts)

-- Terminal split
vim.keymap.set("n", "<leader>T", ":130vsplit term:// bash <CR>i", default_opts)
vim.keymap.set("t", "<leader><Esc>", "<C-\\><C-n>", default_opts)

-- Copy paste from outside/within vim; requires xclip
vim.keymap.set("v", "<leader>y", [["+y]], default_opts)
vim.keymap.set("n", "<leader>y", [["+y]], default_opts)
vim.keymap.set("n", "<leader>Y", [["+Y]], default_opts)

-- Visual mode identation
vim.keymap.set("v","<Tab>", ">gv", default_opts)
vim.keymap.set("v","<S-Tab>", "<gv", default_opts)

-- Visual mode line movement
vim.keymap.set("v","J", ":m '>+1'<CR>gv=gv", default_opts)
vim.keymap.set("v","K", ":m '<-2'<CR>gv=gv", default_opts)

-- Split/window resizing
vim.keymap.set("n","<C-Down>", ":resize -2 <CR>", default_opts)
vim.keymap.set("n","<C-Up>", ":resize +2 <CR>", default_opts)
vim.keymap.set("n","<C-Left>", ":vertical resize -2 <CR>", default_opts)
vim.keymap.set("n","<C-Right>", ":vertical resize +2 <CR>", default_opts)
