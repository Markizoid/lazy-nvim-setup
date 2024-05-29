return {
  "xiyaowong/virtcolumn.nvim",
  config = function()
    local colors = require("solarized-osaka.colors").setup()
    vim.api.nvim_set_hl(0, "CursorLine", { bg = colors.base03 })
  end
}
