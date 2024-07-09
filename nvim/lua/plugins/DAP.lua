return {
  "mfussenegger/nvim-dap",
  config = function()
    local dap = require("dap")
    vim.api.nvim_set_hl(0, "DapBreakpoint", { ctermbg = 0, fg = "#993939" })
    vim.api.nvim_set_hl(0, "DapLogPoint", { ctermbg = 0, fg = "#61afef" })
    vim.api.nvim_set_hl(
      0,
      "DapStopped",
      { ctermbg = 0, fg = "#98c379", bg = "#31353f" }
    )

    vim.fn.sign_define("DapBreakpoint", {
      text = "",
      texthl = "DapBreakpoint",
      linehl = "DapBreakpoint",
      numhl = "DapBreakpoint",
    })
    vim.fn.sign_define("DapBreakpointCondition", {
      text = "󰯲",
      texthl = "DapBreakpoint",
      linehl = "DapBreakpoint",
      numhl = "DapBreakpoint",
    })
    vim.fn.sign_define("DapBreakpointRejected", {
      text = "",
      texthl = "DapBreakpoint",
      linehl = "DapBreakpoint",
      numhl = "DapBreakpoint",
    })
    vim.fn.sign_define("DapLogPoint", {
      text = "",
      texthl = "DapLogPoint",
      linehl = "DapLogPoint",
      numhl = "DapLogPoint",
    })
    vim.fn.sign_define("DapStopped", {
      text = "",
      texthl = "DapStopped",
      linehl = "DapStopped",
      numhl = "DapStopped",
    })

    vim.keymap.set("n", "<leader>dc", function()
      dap.continue()
    end, { desc = "Debug [C]ontinue" })

    vim.keymap.set("n", "<leader>dd", function()
      dap.disconnect()
    end, { desc = "Debug [D]isconnect" })

    vim.keymap.set("n", "<leader>dr", function()
      dap.restart()
    end, { desc = "Debug [R]estart" })

    vim.keymap.set("n", "<leader>do", function()
      dap.step_over()
    end, { desc = "Debug step [O]ver" })

    vim.keymap.set("n", "<leader>di", function()
      dap.step_into()
    end, { desc = "Debug step [I]nto" })

    vim.keymap.set("n", "<leader>dt", function()
      dap.step_out()
    end, { desc = "Debug step ou[T]" })

    vim.keymap.set("n", "<leader>tb", function()
      dap.toggle_breakpoint()
    end, { desc = "Debug toggle [B]reakpoint" })

    vim.keymap.set("n", "<Leader>dl", function()
      require("dap").run_last()
    end, { desc = "Debug run [L]ast" })

    vim.keymap.set({ "n", "v" }, "<Leader>dh", function()
      require("dap.ui.widgets").hover()
    end, { desc = "Debug widgets hover (?)" })

    vim.keymap.set({ "n", "v" }, "<Leader>dp", function()
      require("dap.ui.widgets").preview()
    end, { desc = "Debug widgets preview (?)" })

    vim.keymap.set("n", "<Leader>df", function()
      local widgets = require("dap.ui.widgets")
      widgets.centered_float(widgets.frames)
    end, { desc = "Debug widgets centered float frames (??)" })

    vim.keymap.set("n", "<Leader>ds", function()
      local widgets = require("dap.ui.widgets")
      widgets.centered_float(widgets.scopes)
    end, { desc = "Debug centered float scopes" })
  end,
}
