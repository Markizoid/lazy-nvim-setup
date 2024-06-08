return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "nvim-neotest/nvim-nio",
    },
    config = function()
      vim.keymap.set('n', '<F10>', '<cmd>lua require"dap".step_over()<CR>')
      vim.keymap.set('n', '<F11>', '<cmd>lua require"dap".step_into()<CR>')
      vim.keymap.set('n', '<F12>', '<cmd>lua require"dap".step_out()<CR>')
      vim.keymap.set('n', '<F5>', '<cmd>lua require"dap".continue()<CR>')
      vim.keymap.set('n', '<leader>db', '<cmd>lua require"dap".toggle_breakpoint()<CR>')
      vim.keymap.set('n', '<leader>dc',
        '<cmd>lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>')

      vim.keymap.set('n', '<leader>du', '<cmd>lua require"dapui".toggle()<CR>')
    end
  },

  {
    'rcarriga/nvim-dap-ui',
    dependencies = {
      'mfussenegger/nvim-dap',
    },
    config = function()
      local dap = require('dap')
      local dapui = require('dapui')
      dapui.setup()

      dap.listeners.after.event_initialized['dapui_config'] = function()
        dapui.open()
      end

      dap.listeners.before.event_terminated['dapui_config'] = function()
        dapui.close()
      end

      dap.listeners.before.event_exited['dapui_config'] = function()
        dapui.close()
      end
    end
  },

  {
    'jay-babu/mason-nvim-dap.nvim',
    dependencies = {
      'williamboman/mason.nvim',
      'mfussenegger/nvim-dap',
    },
    config = function()
      require("mason-nvim-dap").setup({
        ensure_installed = { "python","debugpy" },
      })
    end
  },

  {
    'mfussenegger/nvim-dap-python',
    dependencies = {
      'mfussenegger/nvim-dap',
      'rcarriga/nvim-dap-ui',
    },
    ft = { 'python' },
    config = function()
      local path = vim.fn.getcwd() .. '/.venv/Scripts/python.exe'

      require('dap-python').setup(path)
    end
  }
}
-- return {
--   {
--     "mfussenegger/nvim-dap-python"
--   },
--
--   {
--     "mfussenegger/nvim-dap",
--     dependencies = {
--       "rcarriga/nvim-dap-ui",
--       "nvim-neotest/nvim-nio",
--     },
--     config = function()
--       local dap = require("dap")
--       local dapui = require("dapui")
--       dap.adapters.python = function(cb, config)
--         if config.request == 'attach' then
--           ---@diagnostic disable-next-line: undefined-field
--           local port = (config.connect or config).port
--           ---@diagnostic disable-next-line: undefined-field
--           local host = (config.connect or config).host or '127.0.0.1'
--           cb({
--             type = 'server',
--             port = assert(port, '`connect.port` is required for a python `attach` configuration'),
--             host = host,
--             options = {
--               source_filetype = 'python',
--             },
--           })
--         else
--           cb({
--             type = 'executable',
--             command = '~/.virtialenvs/Scripts/python',
--             args = { '-m', 'debugpy.adapter' },
--             options = {
--               source_filetype = 'python',
--             },
--           })
--         end
--       end
--
--       dap.listeners.before.attach.dapui_config = function()
--         dapui.open()
--       end
--       dap.listeners.before.launch.dapui_config = function()
--         dapui.open()
--       end
--       dap.listeners.before.event_terminated.dapui_config = function()
--         dapui.close()
--       end
--       dap.listeners.before.event_exited.dapui_config = function()
--         dapui.close()
--       end
--
--       vim.keymap.set('n', '<leader>dt', dap.toggle_breakpoint, {})
--       vim.keymap.set('n', '<leader>dc', dap.continue, {})
--     end,
--   },
-- }
