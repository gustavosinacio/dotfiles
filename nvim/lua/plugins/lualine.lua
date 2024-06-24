return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("lualine").setup({
      options = {
        theme = "tokyodark",
      },
    })

    vim.keymap.set("n", "<leader>hl", function()
      vim.print(require("lualine").get_config())
    end)
  end,
}
