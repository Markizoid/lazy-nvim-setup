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
      -- ensure_installed = { "debugpy" },
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
      automatic_installation = false,
      ensure_installed = {
        "lua-language-server",
        "jedi-language-server",
        "html",
        "cssls",
        "tailwindcss",
        "graphql",
      },
    })
    require("mason-lspconfig").setup_handlers({
      -- Default handler for all servers
      function(server_name)
        if server_name ~= "pyright" then
          require("lspconfig")[server_name].setup({})
        end
      end,
      -- No-op handler for pyright
      ["pyright"] = function() end,
    })
    -- mason_tool_installer.setup({
    --   ensure_installed = {
    --     "jedi-language-server",
    --     "markdown-oxide",
    --     "prettier", -- prettier formatter
    --     "stylua", -- lua formatter
    --     "black", -- python formatter
    --     "eslint_d",
    --   },
    -- })
  end,
}
