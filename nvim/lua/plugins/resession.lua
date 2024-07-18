return {
  "stevearc/resession.nvim",
  config = function()
    local resession = require("resession")
    resession.setup({})

    vim.keymap.set("n", "<leader>oo", function()
      resession.load("last")
    end)
    vim.keymap.set("n", "<leader>os", resession.save)
    vim.keymap.set("n", "<leader>od", resession.delete)

    vim.api.nvim_create_autocmd("VimLeavePre", {
      callback = function()
        -- Always save a special session named "last"
        resession.save("last")
      end,
    })
  end,
}
