return {
  {
    "craftzdog/solarized-osaka.nvim",
    lazy = true,
    priority = 1000,
    opts = function()
      return {
        transparent = true,
        styles = {
          sidebars = "transparent",
          floats = "transparent",
        }
      }
    end,
  },
  -- {
  --   "svrana/neosolarized.nvim",
  --   dependencies = {
  --     "tjdevries/colorbuddy.nvim",
  --   },
  --   config = function()
  --     require("neosolarized").setup({
  --       transparent = true,
  --       comment_italics = true,
  --       background_set = false,
  --     })
  --     require("notify").setup({
  --       background_colour = "#000000",
  --     })
  --   end,
  -- },
}
