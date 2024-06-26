return {
  "nvim-treesitter/nvim-treesitter-context",
  config = function()
    local colors = require("solarized-osaka.colors").setup()
    vim.api.nvim_set_hl(0, "TreesitterContext", { bg = colors.base03 })

    require("treesitter-context").setup({
      max_lines = 5,
    })
  end
}
