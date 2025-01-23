return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    -- import mason
    local mason = require("mason")

    -- import mason-lspconfig
    local mason_lspconfig = require("mason-lspconfig")

    local mason_tool_installer = require("mason-tool-installer")

    -- enable mason and configure icons
    mason.setup({
      ensure_installed = {"debugpy"},
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
      -- list of servers for mason to install
      ensure_installed = {
        "lua-language-server",
        "jedi-language-server",
        "html",
        "cssls",
        "tailwindcss",
        "graphql",
      },
    })
    mason_tool_installer.setup({
      ensure_installed = {
        -- "jedi-language-server",
        "markdown-oxide",
        "prettier", -- prettier formatter
        "stylua", -- lua formatter
        "black", -- python formatter
        "eslint_d",
      },
    })
  end,
}
