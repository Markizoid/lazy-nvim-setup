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
    end,
  },
  {
    "mfussenegger/nvim-dap",
    config = function(_, opts)
      local dap = require("dap")
      dap.adapters.python = {
        type = "executable",
        command = "C:/Users/user/Development/work/SPPR/venv/Scripts/python.exe",
        args = { "-m", "debugpy.adapter" },
      }
      dap.configurations.python = {
        {
          type = "python",
          request = "launch",
          name = "Launch file",
          program = "${file}",
          args = { "-Xfrozen_modules=off" },
          pythonPath = function()
            -- Use the selected virtual environment from venv-selector
            local venv_path = vim.fn.getenv("VIRTUAL_ENV")
            if venv_path and venv_path ~= vim.NIL then
              return venv_path .. "/Scripts/python.exe"
            else
              -- Fallback to a default path if VIRTUAL_ENV is not set
              return "C:/Users/user/Development/work/SPPR/venv/Scripts/python.exe"
            end
          end,
        },
      }
      vim.keymap.set("n", "<F10>", '<cmd>lua require"dap".step_over()<CR>')
      vim.keymap.set("n", "<F11>", '<cmd>lua require"dap".step_into()<CR>')
      vim.keymap.set("n", "<F12>", '<cmd>lua require"dap".step_out()<CR>')
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
        -- Fallback to a default path if VIRTUAL_ENV is not set
        dap_python.setup("C:/Users/user/Development/work/SPPR/venv/Scripts/python.exe")
      end
      dap_python.test_runner = "pytest"
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
