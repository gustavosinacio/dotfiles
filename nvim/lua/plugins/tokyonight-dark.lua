return {
  "tiagovla/tokyodark.nvim",
  opts = {
    -- custom options here
    transparent_background = true,
    styles = {
      comments = { italic = true },    -- style for comments
      keywords = { italic = true },    -- style for keywords
      identifiers = { italic = true }, -- style for identifiers
      functions = {},                  -- style for functions
      variables = {},                  -- style for variables
    },
  },
  config = function(_, opts)
    require("tokyodark").setup(opts) -- calling setup is optional
    vim.cmd([[colorscheme tokyodark]])
  end,
}
