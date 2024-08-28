return {
  "supermaven-inc/supermaven-nvim",
  config = function()
    require("supermaven-nvim").setup({
      keymaps = {
        accept_suggestion = "<C-l>",
        accept_word = "<C-y>",
      },
      disable_inline_completion = false,
    })
  end,
}
