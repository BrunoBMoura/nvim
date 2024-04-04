return {
  "williamboman/mason.nvim",
  config = function()
    require("mason").setup({
      ui = { border = "rounded" },
      max_concurrent_installers = 4
    })
  end
}
