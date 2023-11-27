local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local user_group = augroup("user", {})

autocmd("BufWritePre", {
  group = user_group,
  pattern = "*",
  command = "%s/\\s\\+$//e"
})

local lang_meta_op = {
  c      = { format = "clang-format -i"},
  rust   = { format = "rustfmt", build = "cargo build", exec = "cargo run"},
  ruby   = { small_indent = true, exec = "ruby" },
  lua    = { small_indent = true, exec = "lua" },
  python = { exec = "python" }
}

for lang, data in pairs(lang_meta_op) do
  if data.format ~= nil then
    autocmd( "FileType", {
      command = "nnoremap <leader><leader>f :!" .. data.format .. " % <CR>",
      pattern = lang
    })
  end
  if data.small_indent ~= nil then
    autocmd("FileType", {
      pattern = lang,
      callback = function()
        vim.opt_local.listchars:append({ leadmultispace = "▏ "})
        vim.opt_local.shiftwidth = 2
        vim.opt_local.tabstop = 2
      end
    })
  end
  if data.exec then
    autocmd("FileType", {
      command = "nnoremap <leader><leader>e :vsplit <CR>:ter " .. data.exec .. " % <CR>",
      pattern = lang
    })
  end
end
