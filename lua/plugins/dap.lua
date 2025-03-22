return {
  "rcarriga/nvim-dap-ui",
  dependencies = {
    "mfussenegger/nvim-dap",
    "mfussenegger/nvim-dap-python",
    "nvim-neotest/nvim-nio",
    "theHamsta/nvim-dap-virtual-text",
  },
  config = function()
    require("dap-python").setup("python3")
    local dap, dapui = require("dap"), require("dapui")
    dapui.setup()
    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end
    vim.keymap.set("n", "<F5>", function()
      require("dap").continue()
    end, { desc = "Debug: continue" })
    vim.keymap.set("n", "<F2>", function()
      require("dap").step_over()
    end, { desc = "Debug: step over" })
    vim.keymap.set("n", "<F1>", function()
      require("dap").step_into()
    end, { desc = "Debug: step into" })
    vim.keymap.set("n", "<F3>", function()
      require("dap").step_out()
    end, { desc = "Debug: step out" })
    vim.keymap.set("n", "<F4>", function()
      require("dap").terminate()
    end, { desc = "Debug: terminate" })
    vim.keymap.set("n", "<Leader>b", function()
      require("dap").toggle_breakpoint()
    end, { desc = "Toggle breakpoint" })
    vim.keymap.set("n", "<Leader>B", function()
      require("dap").set_breakpoint()
    end, { desc = "Debug: set breakpoint" })
    vim.keymap.set("n", "<Leader>lp", function()
      require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
    end, { desc = "Debug: set logpoint" })
    vim.keymap.set("n", "<Leader>dr", function()
      require("dap").repl.open()
    end, { desc = "Debug: open repl" })
    vim.keymap.set("n", "<Leader>dl", function()
      require("dap").run_last()
    end, { desc = "Debug: run last" })
    require("nvim-dap-virtual-text").setup({})
  end,
  init = function()
    vim.fn.sign_define("DapBreakpoint", { text = " ", texthl = "DapBreakpoint", linehl = "", numhl = "" })
    vim.fn.sign_define(
      "DapBreakpointCondition",
      { text = " ", texthl = "DapBreakpointCondition", linehl = "", numhl = "" }
    )
    vim.fn.sign_define("DapLogPoint", { text = " ", texthl = "DapLogPoint", linehl = "", numhl = "" })
    vim.fn.sign_define("DapStopped", { text = " ", texthl = "LspDiagnosticsWarning" })
    vim.fn.sign_define("DapBreakpointRejected", { text = " ", texthl = "LspDiagnosticsError" })
  end,
}
