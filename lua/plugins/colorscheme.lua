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
        ---@class Highlights
        on_highlights = function(hl, c)
          -- здесь можно настраивать цвета для Highlight Groups
          hl.NormalFloat = { bg = "none" }
          -- neotree groups
          hl.NeoTreeNormal = { bg = "none" }
          hl.NeoTreeNormalNC = { bg = "none" }
          -- blink-cmp groups
          hl.BlinkCmpMenu = { 
            bg = c.base03, 
            -- fg = c.orange700 
          }
          hl.BlinkCmpMenuBorder = { fg = c.orange700 }
          hl.BlinkCmpDoc = { bg = "none" }
          hl.BlinkCmpDocBorder = { bg = "none", fg = c.orange700 }
          hl.BlinkCmpSignatureHelp = { bg = "none" }
          hl.BlinkCmpSignatureHelpBorder = { bg = "none", fg = c.orange700 }
          -- fzf groups
          hl.FzfLuaNormal = { bg = "none" }
          hl.FzfLuaBorder = { bg = "none", fg = c.orange700 }
          hl.FzfLuaTitle = { bg = "none", fg = c.orange300 }
          hl.WhichKey = { bg = "none"}
          hl.WhichKeyBorder = { bg = "none", fg = c.orange700 }
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
