return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    -- "MunifTanjim/nui.nvim",
  },
  config = function()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    -- Make neo-tree transparent
    vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { bg = "none" })
    vim.api.nvim_set_hl(0, "NeoTreeFloatBorder", { bg = "none" })
    vim.api.nvim_set_hl(0, "NeoTreeFloatTitle", { bg = "none" })
    require("neo-tree").setup({
      default_component_configs = {
        icon = {
          folder_closed = "⮞", -- arrow when folder is closed
          folder_open = "⮛", -- arrow when folder is open
          -- folder_closed = "🠞", -- arrow when folder is closed
          -- folder_open = "⭸", -- arrow when folder is open
        },
        last_modified = {

          enabled = true,
          required_width = 60,
        }
      }
    })
  end
}
