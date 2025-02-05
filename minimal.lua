-- minimal.lua

-- Bootstrap lazy.nvim if not already installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable version
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- (Optional) Set runtimepath if needed
vim.cmd("set runtimepath^=C:/Users/Ruslan/AppData/Local/nvim") -- Adjust if needed

require("lazy").setup({
  -- Add nvim-lspconfig so that Mason-lspconfig can integrate with it.
  {
    "neovim/nvim-lspconfig",
  },
  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    config = function()
      local mason = require("mason")
      local mason_lspconfig = require("mason-lspconfig")
      local mason_tool_installer = require("mason-tool-installer")

      mason.setup({
        ensure_installed = { "debugpy" },
        providers = {
          "mason.providers.client",
          "mason.providers.registry-api",
        },
        PATH = "prepend",
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      })

      mason_lspconfig.setup({
        automatic_installation = false, -- disable auto-installation
        ensure_installed = {
          "lua_ls", -- corrected name for lua-language-server
          "html",
          "cssls",
          "tailwindcss",
          "graphql",
        },
      })
      -- Override the default handlers
      mason_lspconfig.setup_handlers({
        -- This default handler is called for every server.
        -- It will set up servers normally except for pyright.
        function(server_name)
          if server_name ~= "pyright" then
            require("lspconfig")[server_name].setup({})
          end
        end,
        -- A no-op handler for pyright prevents it from being set up
        ["pyright"] = function() end,
      })
      mason_tool_installer.setup({
        ensure_installed = {
          "jedi-language-server",
          "markdown-oxide",
          "prettier", -- prettier formatter
          "stylua", -- lua formatter
          "black", -- python formatter
          "eslint_d",
        },
      })
    end,
  },
  {
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
          border = "none",
          -- winblend = 0,
          min_width = 20,
          max_height = 15,
          -- winhighlight = "Normal:BlinkCmpMenu,FloatBorder:BlinkCmpMenuBorder",
          -- draw = {
          --   treesitter = { "lsp" },
          -- },
        },
        documentation = {
          auto_show = true,
          window = {
            min_width = 20,
            max_width = 60,
            max_height = 80,
            border = "single",
          },
        },
      }
      signature = {
        enabled = true,
        window = {
          min_width = 20,
          max_width = 60,
          max_height = 80,
          border = 'single'
        },
      }

      -- Default list of enabled providers defined so that you can extend it
      -- elsewhere in your config, without redefining it, due to `opts_extend`
      opts.sources = {
        default = { "snippets", "lsp", "path", "buffer" },
      }
    end,
    opts_extend = { "sources.default" },
  },
})
