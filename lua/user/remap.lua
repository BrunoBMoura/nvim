local nnoremap = require("user.keymap").nnoremap
local vnoremap = require("user.keymap").vnoremap
local tnoremap = require("user.keymap").tnoremap

-- Refresh ctags
nnoremap("<leader>c", ":! ctags -R . <CR>")

-- Split movement
nnoremap("<C-h>", "<C-w>h")
nnoremap("<C-j>", "<C-w>j")
nnoremap("<C-k>", "<C-w>k")
nnoremap("<C-l>", "<C-w>l")
nnoremap("<C-q>", "<C-w>q")

-- Tab movement
nnoremap("<", ":tabp<CR>")
nnoremap(">", ":tabn<CR>")
nnoremap("<S-l>", ":bnext<CR>")
nnoremap("<S-h>", ":bprevious<CR>")

-- Lazy movement
nnoremap("<C-d>", "<C-d>zz")
nnoremap("<C-u>", "<C-u>zz")

-- Lazy saving/quitting
nnoremap("<leader>w", ":w<CR>")
nnoremap("<leader>q", ":q<CR>")

-- Overide shenanigans
nnoremap("<leader>rw", "cw<C-r>0<C-c>")
vnoremap("p", '"_dP')

-- Terminal split
nnoremap("<leader>T", ":130vsplit term:// bash <CR>i")
tnoremap("<leader><Esc>", "<C-\\><C-n>")

-- Copy paste from outside/within vim; requires xclip
vnoremap("<leader>y", [["+y]])
nnoremap("<leader>y", [["+y]])
nnoremap("<leader>Y", [["+Y]])

-- Visual mode identation
vnoremap("<Tab>", ">gv")
vnoremap("<S-Tab>", "<gv")

-- Visual mode line movement
vnoremap("J", ":m '>+1'<CR>gv=gv")
vnoremap("K", ":m '<-2'<CR>gv=gv")

-- Split/window resizing
nnoremap("<C-Down>", ":resize -2 <CR>")
nnoremap("<C-Up>", ":resize +2 <CR>")
nnoremap("<C-Left>", ":vertical resize -2 <CR>")
nnoremap("<C-Right>", ":vertical resize +2 <CR>")

--        _             _         _     _           _
--  _ __ | |_   _  __ _(_)_ __   | |__ (_)_ __   __| |___
-- | '_ \| | | | |/ _` | | '_ \  | '_ \| | '_ \ / _` / __|
-- | |_) | | |_| | (_| | | | | | | |_) | | | | | (_| \__ \
-- | .__/|_|\__,_|\__, |_|_| |_| |_.__/|_|_| |_|\__,_|___/
-- |_|            |___/

-- Overall file, grep and buffers explorers.
nnoremap("<leader>lg", ":Telescope live_grep <CR>")
nnoremap("<leader>fh", ":Telescope highlights <CR>")
nnoremap("<leader>ff", ":Telescope find_files <CR>")
nnoremap("<leader>fb", ":Telescope buffers <CR>")
nnoremap("<leader>/", function()
  require("telescope.builtin").grep_string({
    -- Grep for the word under the cursor.
    search = vim.fn.input("Grep >")
  });
end)
vnoremap("<leader>/", function()
  require("telescope.builtin").grep_string(
  -- Same as above, but searching selected text in visual mode.
    vim.fn.getline("'<", "'>")
  );
end)

-- File tree related.
nnoremap("<leader>e", ":NvimTreeToggle<CR>")
nnoremap("<leader>F", ":NvimTreeFindFile<CR>")
nnoremap("<leader>R", ":NvimTreeRefresh<CR>")

-- Git related.
nnoremap("<leader>gb", ":Git blame <CR>")
nnoremap("<leader>gl", ":vertical Git log --graph <CR>")

-- Git hunk navigation.
nnoremap("<leader>gs", ":Gitsigns preview_hunk<CR>")
nnoremap("<leader>gn", ":Gitsigns next_hunk<CR>")
nnoremap("<leader>gp", ":Gitsigns prev_hunk<CR>")

-- Diffview related.
nnoremap("<leader>do", ":DiffviewOpen <CR>")
nnoremap("<leader>dh", ":DiffviewFileHistory <CR>")
