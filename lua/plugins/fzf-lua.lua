return {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  -- dependencies = { "nvim-tree/nvim-web-devicons" },
  -- or if using mini.icons/mini.nvim
  dependencies = { "echasnovski/mini.icons" },
  config = function()
    require("fzf-lua").setup({
      "fzf-native",
      winopts = {
        col = 1,
        row = 1,
        height = 0.8,
        width = 0.5,
        preview = {
          default = "builtin",
        },
      },
      -- keymap = {
      --   ["<ctrl-Space>"] = "file-selection-to-qf",
      -- },
      -- defaults = {
      --   copen = "topright copen"
      -- }
      -- hls = {
      --     normal = {"Normal"},
      -- }
      -- -- hls.normal = {"Normal"}
    })
  end,
  -- opts = {
  --   hls = {
  --     normal = { "Normal" },
  --     border = { "FloatBorder" },
  --   },
  -- },
}
