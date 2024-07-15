return {
  {
    "nvim-neotest/nvim-nio",
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
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
    end,
  },
  {
    "mfussenegger/nvim-dap",
    config = function(_, opts)
      local dap = require("dap")
      dap.adapters.python = {
        type = "server",
        host = "127.0.0.1",
        port = 5678,
      }

      dap.configurations.python = {
        {
          type = "python",
          request = "attach",
          name = "Attach to process",
          -- program = "${file}",
          connect = {
            host = "127.0.0.1",
            port = 5678,
          },
          pythonPath = function()
            return "C:/Marat/NOC/SPPR/venv/Scripts/python.exe"
          end,
          subProcess = true,
          justMyCode = true,
        },
      }
      -- dap.adapters.python = {
      --   type = "executable",
      --   command = "C:/Marat/NOC/SPPR/venv/Scripts/python.exe", -- Ensure this path is correct
      --   args = { "-m", "debugpy.adapter", "--log-to-stderr", "--log-level=debug", },
      -- }
      -- dap.configurations.python = {
      --   {
      --     type = "python",
      --     request = "attach",
      --     name = "Attach to running script",
      --     host = "localhost",
      --     port = 5678,
      --     -- program = "${file}",
      --     pythonPath = function()
      --       local venv_path = vim.fn.getenv("VIRTUAL_ENV")
      --       if venv_path and venv_path ~= vim.NIL then
      --         return venv_path .. "/Scripts/python.exe"
      --       else
      --         return "C:/Marat/NOC/SPPR/venv/Scripts/python.exe" -- Ensure this path is correct
      --       end
      --     end,
      --   },
      -- }

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
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
    },
    config = function(_, opts)
      local dap_python = require("dap-python")
      local venv_path = vim.fn.getenv("VIRTUAL_ENV")
      if venv_path and venv_path ~= vim.NIL then
        dap_python.setup(venv_path .. "/Scripts/python.exe")
      else
        dap_python.setup("C:/Marat/NOC/SPPR/venv/Scripts/python.exe")
      end
      dap_python.test_runner = "pytest"
      -- dap_python.default_port = 38000

    end,
    keys = {
      {
        "<leader>dt",
        function()
          require("dap-python").test_method()
        end,
      },
    },
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
