local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local user_group = augroup("user", {})

-- Remove empty spaces at the end of lines
autocmd("BufWritePre", {
  group = user_group,
  pattern = "*",
  command = "%s/\\s\\+$//e"
})

-- Set each terminal buffer as unlisted
autocmd("TermOpen", {
  group = user_group,
  callback = function()
    vim.api.nvim_set_option_value('bl', false, { buf = 0 })
  end,
})

local lang_meta_op = {
  c      = { format = "clang-format -i" },
  rust   = { format = "rustfmt", build = "cargo build" },
  ruby   = { small_indent = true },
  lua    = { small_indent = true },
}

for lang, data in pairs(lang_meta_op) do
  if data.format ~= nil then
    autocmd("FileType", {
      command = "nnoremap <leader><leader>f :!" .. data.format .. " % <CR>",
      pattern = lang
    })
  end
  if data.small_indent ~= nil then
    autocmd("FileType", {
      pattern = lang,
      callback = function()
        vim.opt_local.listchars:append({ leadmultispace = USER.indent_marker(2) })
        vim.opt_local.shiftwidth = 2
        vim.opt_local.tabstop = 2
      end
    })
  end
end
