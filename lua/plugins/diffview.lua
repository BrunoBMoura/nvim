return {
  "sindrets/diffview.nvim",
  config = function()
    require("diffview").setup({
      view = {
        merge_tool = {
          layout = "diff3_vertical",
          disable_diagnostics = true,
        }
      }
    })
  end
}
