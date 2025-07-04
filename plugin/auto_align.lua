function align_line_ends()
 local start_line = vim.fn.getpos("'<")[2]
  local end_line = vim.fn.getpos("'>")[2]

  -- Get lines from buffer
  local lines = vim.api.nvim_buf_get_lines(0, start_line - 1, end_line, false)

  -- Find the max visual line length, ignoring the last character
  local max_len = 0
  for _, line in ipairs(lines) do
    if #line > 0 then
      max_len = math.max(max_len, #line)
    end
  end

  -- Modify each line
  for i, line in ipairs(lines) do
    if #line > 0 then
      local last_char = line:sub(-1)
      local body = line:sub(1, -2)

      -- Calculate how many spaces to insert between body and last char
      local spaces_needed = max_len - #line + 1
      lines[i] = body .. string.rep(' ', spaces_needed) .. last_char
    end
  end

  -- Set the modified lines
  vim.api.nvim_buf_set_lines(0, start_line - 1, end_line, false, lines)
end

vim.api.nvim_create_user_command("AlignLineEnds", align_line_ends, { range = true })
