return {
  "neovim/nvim-lspconfig",
  dependencies = { "hrsh7th/cmp-nvim-lsp" },
  config = function()
    local lspconfig = require("lspconfig")
    for _, server in pairs(USER.lsp.servers) do
      local opts = {
        on_attach = function(_, _)
          vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
          vim.keymap.set("n", "gr", vim.lsp.buf.rename, {})
        end,
        capabilities = require("cmp_nvim_lsp").default_capabilities()
      }
      if USER.lsp_settings[server] then
        opts = vim.tbl_deep_extend("force", USER.lsp.settings[server], opts)
      end
      lspconfig[server].setup(opts)
    end
  end
}
