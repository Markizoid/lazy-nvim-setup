return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = function(_, opts)
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    opts.win = {
      -- no_overlap = false,
      border = "none",
      padding = { 2, 2 },
      height = { min = 1, max = 10 },
      -- col = 3,
      width = 200
    }

    opts.layout = {
      align = "center",
      height = { min = 1, max = 20 },
      spacing = 1,
      -- width = { min = 2, max = 15 },
    }
  end,
}
