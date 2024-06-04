local function map(mode, key, command, opts)
  opts = opts or { noremap = false, silent = true }
  vim.keymap.set(mode, key, command, opts)
end

-- Refresh ctags
map("n", "<leader>c", ":! ctags -R . <CR>")

-- Split movement
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")
map("n", "<C-q>", "<C-w>q")

-- Tab movement
map("n", "<", ":tabp<CR>")
map("n", ">", ":tabn<CR>")
map("n", "<S-l>", ":bnext<CR>")
map("n", "<S-h>", ":bprevious<CR>")

-- Lazy movement
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "<S-u>", "<C-r>")

-- Quickfix movement
map("n", "J", ":cnext<CR>")
map("n", "K", ":cprev<CR>")

-- Lazy saving/quitting
map("n", "<leader>w", ":w<CR>")

-- Overide shenanigans
map("n", "<leader>rw", "cw<C-r>0<C-c>")
map("v", "p", '"_dP')

-- Terminal split
map("n", "<leader>T", ":130vsplit term:// bash <CR>i")
map("t", "<leader><Esc>", "<C-\\><C-n>")

-- Copy paste from outside/within vim; requires xclip
map("v", "<leader>y", [["+y]])
map("n", "<leader>y", [["+y]])
map("n", "<leader>Y", [["+Y]])

-- Visual mode identation
map("v", "<Tab>",   ">gv")
map("v", "<S-Tab>", "<gv")

-- Visual mode line movement
map("v", "J", ":m '>+1'<CR>gv=gv")
map("v", "K", ":m '<-2'<CR>gv=gv")

-- Split/window resizing
map("n", "<C-Down>",  ":resize -2 <CR>")
map("n", "<C-Up>",    ":resize +2 <CR>")
map("n", "<C-Left>",  ":vertical resize -2 <CR>")
map("n", "<C-Right>", ":vertical resize +2 <CR>")

-- Show LSP diagnostics
map("n", "<leader>ds", function()
  vim.diagnostic.open_float(nil, {
    focusable = false, border = "rounded"
  })
end)
--[[ map("n", "<leader><C-]>", function()
  local buf = vim.api.nvim_get_current_buf()
  local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)

  -- Create a new buffer
  local new_buf = vim.api.nvim_create_buf(true, false)

  -- Set the contents of the new buffer
  vim.api.nvim_buf_set_lines(new_buf, 0, -1, false, lines)

  -- Create a floating window
  local width = math.floor(vim.o.columns * 0.5)
  local height = math.floor(vim.o.lines * 0.4)
  local win = vim.api.nvim_open_win(new_buf, true, {
    relative = 'editor',
    width = width,
    height = height,
    row = 0,
    col = 8,
    style = 'minimal',
    border = 'rounded',
  })

  vim.api.nvim_win_set_option(win, 'number', true)
  vim.api.nvim_win_set_option(win, 'relativenumber', true)
  vim.api.nvim_set_current_buf(new_buf)

  local word = vim.fn.expand("<cword>")
  vim.cmd('tag ' .. word)
  vim.cmd('set number')
  vim.cmd('TSBufEnable highlight')

  -- vim.api.nvim_create_autocmd("BufWipeout", {
  vim.api.nvim_create_autocmd("BufWinLeave", {
    buffer = new_buf,
    callback = function()
      -- vim.api.nvim_buf_delete(buf, { force = true })
      vim.api.nvim_win_close(new_buf, true)
    end,
  })
end) ]]
