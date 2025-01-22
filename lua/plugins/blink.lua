return {
  'saghen/blink.cmp',
  -- optional: provides snippets for the snippet source
  dependencies = 'rafamadriz/friendly-snippets',

  -- use a release tag to download pre-built binaries
  version = '*',
  -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
  -- build = 'cargo build --release',
  -- If you use nix, you can build from source using latest nightly rust with:
  -- build = 'nix run .#build-plugin',

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  config = function()
    local colors = require("solarized-osaka.colors").setup()
    local blink = require('blink.cmp')

    -- vim.api.nvim_set_hl(0, "BlinkCmpMenu", { bg = colors.base03 })
    vim.api.nvim_set_hl(0, "BlinkCmpMenuBorder", { bg = colors.orange02 })
  -- opts = {
    -- 'default' for mappings similar to built-in completion
    -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
    -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
    -- See the full "keymap" documentation for information on defining your own keymap.
    blink.setup({
      keymap = {
        preset = 'default',
        ['<CR>'] = { 'accept', 'fallback' },
        ['<C-k>'] = { 'select_prev', 'fallback' },
        ['<C-j>'] =  { 'select_next', 'fallback' },
      },
      appearance = {
        highlight_ns = vim.api.nvim_create_namespace('blink.cmp'),
        -- Sets the fallback highlight groups to nvim-cmp's highlight groups
        -- Useful for when your theme doesn't support blink.cmp
        -- Will be removed in a future release
        use_nvim_cmp_as_default = true,
        -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
        -- Adjusts spacing to ensure icons are aligned
        nerd_font_variant = 'mono'
      },
      completion = {
        menu = {
          border = 'double',
          winblend = 0,
          min_width = 20,
          max_height = 15,
          -- winhighlight = 'Normal:BlinkCmpMenu,FloatBorder:BlinkCmpMenuBorder',
          draw = {
            treesitter = {'lsp'},

          }
        },
        documentation = {
          window = {
            min_width = 20,
            max_width = 80,
            max_height = 80,
            border = 'single'
          }
        },
      },
      -- signature = {
      --   window = {
      --     border = 'single'
      --   },
      -- },

      -- Default list of enabled providers defined so that you can extend it
      -- elsewhere in your config, without redefining it, due to `opts_extend`
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      },
    })
  end,
  opts_extend = { "sources.default" },
}
