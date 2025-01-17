return {
  {
    "mfussenegger/nvim-dap",
    config = function(_, opts)
      local dap = require("dap")

      dap.adapters.python = {
        type = "server",
        host = "127.0.0.1",
        port = 5681, -- Ensure this matches the port in `debugpy.listen`
        options = { timeout = 1000 },
      }

      dap.configurations.python = {
        {
          type = "python",
          request = "attach",
          name = "attach to process",
          connect = {
            host = "127.0.0.1",
            port = 5681,
          },
          pythonPath = function()
            return "C:\\Users\\user\\development\\work\\sppr\\venv\\scripts\\python.exe"
          end,
        },
      }
    end,
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
      require("dap-python").setup("C:\\Users\\user\\development\\work\\sppr\\venv\\scripts\\python.exe")
      vim.keymap.set("n", "<F5>", function()
        require("dap").continue()
      end) -- Start/Continue the debug session
      vim.keymap.set("n", "<F10>", function()
        require("dap").step_over()
      end) -- Step over the function
      vim.keymap.set("n", "<F11>", function()
        require("dap").step_into()
      end) -- Step into the function
      vim.keymap.set("n", "<F12>", function()
        require("dap").step_out()
      end) -- Step out of the function
      vim.keymap.set("n", "<leader>db", function()
        require("dap").toggle_breakpoint()
      end) -- Toggle breakpoint
      vim.keymap.set("n", "<leader>dc", function()
        require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
      end) -- Conditional breakpoint
      vim.keymap.set("n", "<leader>dr", function()
        require("dap").repl.open()
      end) -- Open REPL
      vim.keymap.set("n", "<leader>dl", function()
        require("dap").run_last()
      end) -- Rerun last debug session

      -- DAP UI specific bindings
      vim.keymap.set("n", "<leader>du", function()
        require("dapui").toggle()
      end) -- Toggle DAP UI
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "nvim-neotest/nvim-nio" },
    config = function(_, opts)
      require("dapui").setup()
    end,
  },
}
