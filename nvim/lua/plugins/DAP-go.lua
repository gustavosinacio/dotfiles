return {
  "leoluz/nvim-dap-go",
  ft = "go",
  dependencies = {
    "mfussenegger/nvim-dap",
    "rcarriga/nvim-dap-ui",
  },
  opts = {
    delve = {
      detached = vim.fn.has("win32") == 0,
    },
  },
  config = function(_, opts)
    require("dap-go").setup(opts)
    require("dap").set_log_level("TRACE")
  end,
}
