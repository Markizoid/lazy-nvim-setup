return {
  {
    "nvim-neotest/nvim-nio",
  },
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
    },
    config = function(_, opts)
      local dap = require("dap")
      local dapui = require("dapui")

      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end

      -- Enable logging
      dap.set_log_level("TRACE")

      -- local path = "~/.virtualenvs/debugpy/Scripts/python.exe"
      local path = require("mason-registry").get_package("debugpy"):get_install_path() .. "/venv/Scripts/python.exe"
      require("dap-python").setup(path)
    end
  },
  {
    "mfussenegger/nvim-dap",
    config = function(_, opts)
      local dap = require("dap")
      -- dap.adapters.python = {
      --   type = "server",
      --   host = "127.0.0.1",
      --   port = 55486,
      -- }
      --
      -- dap.configurations.python = {
      --   {
      --     type = "python",
      --     request = "attach",
      --     name = "Attach to process",
      --     -- program = "${file}",
      --     connect = {
      --       host = "127.0.0.1",
      --       port = 55486,
      --     },
      --     pythonPath = function()
      --       return "C:/Marat/NOC/SPPR/venv/Scripts/python.exe"
      --     end,
      --     subProcess = true,
      --     justMyCode = true,
      --   },
      -- }
      
      -- local path = require("mason-registry").get_package("debugpy"):get_install_path() .. "\\venv\\Scripts\\python.exe"
      -- dap.adapters.python = {
      --   type = "executable",
      --   command = path, -- Ensure this path is correct
      --   args = { "-m", "debugpy.adapter", "--log-to-stderr", "--log-level=debug", "--multiprocess", "--qt-support=auto"},
      -- }
      -- dap.configurations.python = {
      --   {
      --     type = "python", -- the type here establishes the link to the adapter definition: `dap.adapters.python`
      --     request = "launch",
      --     name = "Launch file",
      --     program = "${file}", -- This configuration will launch the current file if used.
      --     pythonPath = function()
      --       return "./venv/Scripts/python.exe"
      --     end;
      --   },
      -- }
      -- -- dap.configurations.python = {
      -- --   {
      -- --     type = "python",
      -- --     request = "attach",
      -- --     name = "Attach to running script",
      -- --     host = "localhost",
      -- --     port = 5678,
      -- --     -- program = "${file}",
      -- --     pythonPath = function()
      -- --       local venv_path = vim.fn.getenv("VIRTUAL_ENV")
      -- --       if venv_path and venv_path ~= vim.NIL then
      -- --         return venv_path .. "/Scripts/python.exe"
      -- --       else
      -- --         return "$env:PYTHONPATH/python.exe" -- Ensure this path is correct
      -- --       end
      -- --     end,
      -- --   },
      -- -- }

      vim.keymap.set("n", "<F1>", '<cmd>lua require"dap".step_over()<CR>')
      vim.keymap.set("n", "<F2>", '<cmd>lua require"dap".step_into()<CR>')
      vim.keymap.set("n", "<F3>", '<cmd>lua require"dap".step_out()<CR>')
      vim.keymap.set("n", "<F5>", '<cmd>lua require"dap".continue()<CR>')
      vim.keymap.set("n", "<leader>db", '<cmd>lua require"dap".toggle_breakpoint()<CR>')
      vim.keymap.set(
        "n",
        "<leader>dc",
        '<cmd>lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>'
      )
      vim.keymap.set("n", "<leader>du", '<cmd>lua require"dapui".toggle()<CR>')
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "pytest",
        "debugpy",
      },
    },
  },
}
