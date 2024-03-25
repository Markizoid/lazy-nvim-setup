return {
  {
    "craftzdog/solarized-osaka.nvim",
    lazy = true,
    priority = 1000,
    opts = function()
      return {
        transparent = true,
      }
    end,
  },
  {
    "svrana/neosolarized.nvim",
    dependencies = {
      "tjdevries/colorbuddy.nvim",
    },
    config = function()
      require("neosolarized").setup({
        comment_italics = true,
        background_set = false,
      })
      require("notify").setup({
        background_colour = "#000000",
      })
    end,
  },
}
