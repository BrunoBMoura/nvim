return {
  'kevinhwang91/nvim-ufo',
  dependencies = { 'kevinhwang91/promise-async' },
  config = function()
    require('ufo').setup({
      open_fold_hl_timeout = 0,
      -- close_fold_kinds_for_ft = {c = {}},
      provider_selector = function(_bufnr, _filetype, _buftype)
        return {'treesitter', 'indent'}
      end,
      fold_virt_text_handler = function(virt_text, lnum, end_lnum, width, truncate)
        local new_virt_text = {}
        local suffix = string.format("¬ [%d lines]", end_lnum - lnum)
        local suf_width = vim.fn.strdisplaywidth(suffix)
        local target_width = width - suf_width
        local cur_width = 0

        for _, chunk in ipairs(virt_text) do
          local chunk_text = chunk[1]
          local chunk_width = vim.fn.strdisplaywidth(chunk_text)
          if target_width > cur_width + chunk_width then
            table.insert(new_virt_text, chunk)
            cur_width = cur_width + chunk_width
          else
            chunk_text = truncate(chunk_text, target_width - cur_width)
            table.insert(new_virt_text, {chunk_text, chunk[2]})
            break
          end
        end

        table.insert(new_virt_text, {suffix, 'MoreMsg'})
        return new_virt_text
      end
    })
  end
}
