return {
  "saghen/blink.cmp",
  -- optional: provides snippets for the snippet source
  dependencies = "rafamadriz/friendly-snippets",

  -- use a release tag to download pre-built binaries
  version = "*",
  -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
  -- build = 'cargo build --release',
  -- If you use nix, you can build from source using latest nightly rust with:
  -- build = 'nix run .#build-plugin',

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = function(_, opts)
    opts.keymap = {
      preset = "default",
      ["<Tab>"] = { "accept", "fallback" },
      ["<C-k>"] = { "select_prev", "fallback" },
      ["<C-j>"] = { "select_next", "fallback" },
    }
    opts.appearance = {
      highlight_ns = vim.api.nvim_create_namespace("blink.cmp"),
      -- Sets the fallback highlight groups to nvim-cmp's highlight groups
      -- Useful for when your theme doesn't support blink.cmp
      -- Will be removed in a future release
      -- use_nvim_cmp_as_default = true,
      -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
      -- Adjusts spacing to ensure icons are aligned
      nerd_font_variant = "mono",
    }
    opts.completion = {
      menu = {
        border = "padded",
        winblend = 0,
        min_width = 20,
        max_height = 15,
        -- winhighlight = 'Normal:BlinkCmpMenu,FloatBorder:BlinkCmpMenuBorder',
        draw = {
          treesitter = { "lsp" },
        },
      },
      documentation = {
        window = {
          min_width = 20,
          max_width = 80,
          max_height = 80,
          border = "single",
        },
      },
    }
    -- signature = {
    --   window = {
    --     border = 'single'
    --   },
    -- },

    -- Default list of enabled providers defined so that you can extend it
    -- elsewhere in your config, without redefining it, due to `opts_extend`
    opts.sources = {
      default = { "lsp", "path", "snippets", "buffer" },
    }
    
    require('solarized-osaka').setup({
      on_colors = function( hl )
        local colors = require('solarized-osaka.colors').setup()
        hl.BlinkCmpMenu = { fg = colors.orange, bg = colors.orange }
      end
    })
  end,
  opts_extend = { "sources.default" },
  -- Highlight the BlinkCmpMenu group
}
