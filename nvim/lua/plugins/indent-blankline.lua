return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  config = function()
    local highlight = {
      "RainbowDark",
      "RainbowDarker",
    }

    local hooks = require("ibl.hooks")
    -- create the highlight groups in the highlight setup hook, so they are reset
    -- every time the colorscheme changes
    hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
      vim.api.nvim_set_hl(0, "RainbowDarker", { fg = "#262626" })
      vim.api.nvim_set_hl(0, "RainbowDark", { fg = "#232323" })
      vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#0F9D7B" })
    end)

    vim.g.rainbow_delimiters = { highlight = highlight }

    require("ibl").setup({
      scope = { highlight = "RainbowBlue", char = "" },
      indent = { highlight = highlight, char = "" },
    })

    hooks.register(
      hooks.type.SCOPE_HIGHLIGHT,
      hooks.builtin.scope_highlight_from_extmark
    )
  end,
}
