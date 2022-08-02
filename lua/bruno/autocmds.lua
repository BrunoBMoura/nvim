local augroup = vim.api.nvim_create_augroup
local bruno_group = augroup("Bruno", {})
local autocmd = vim.api.nvim_create_autocmd

autocmd({"BufWritePre"}, {
  group = bruno_group,
  pattern = "*",
  command = "%s/\\s\\+$//e",
})

local lang_meta_op = {
  c = {format = "clang-format"},
  rust = {format = "rustfmt"},
  ruby = {small_indent = true},
  lua = {small_indent = true}
}

for lang, data in pairs(lang_meta_op) do
  if data.format ~= nil then
    autocmd(
      "FileType",
      {command = "nnoremap <leader><leader>f :!" .. data.format .. " % <CR>", pattern = lang}
    )
  end
  if data.small_indent ~= nil then
    autocmd(
      "FileType",
      {command = "setlocal shiftwidth=2 tabstop=2", pattern = lang}
    )
  end
end
