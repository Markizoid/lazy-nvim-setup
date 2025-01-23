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
        },
      }
    end,
    config = function()
      require("solarized-osaka").setup({
        on_highlights = function(hl, c)
          -- здесь можно настраивать цвета для Highlight Groups
          hl.NeoTreeNormal = { bg = "none"}
          hl.NeoTreeNormalNC = { bg = "none"}
          hl.BlinkCmpMenu = { bg = "none", fg = c.orange700 }
          hl.BlinkCmpMenuBorder = { fg = c.orange700 }
          hl.NormalFloat = { bg = "none" }
          hl.FzfLuaNormal = { bg = "none" }
          hl.FzfLuaBorder = { bg = "none" , fg = c.orange700 }
          hl.FzfLuaTitle = { bg = "none" , fg = c.orange300 }
        end,
      })
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
