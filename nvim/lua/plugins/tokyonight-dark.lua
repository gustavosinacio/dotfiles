return {
  "tiagovla/tokyodark.nvim",
  opts = {
    -- custom options here
    transparent_background = true,
    styles = {
      comments = { italic = true }, -- style for comments
      keywords = { italic = true }, -- style for keywords
      identifiers = { italic = true }, -- style for identifiers
      functions = {}, -- style for functions
      variables = {}, -- style for variables
    },
  },
  config = function(_, opts)
    require("tokyodark").setup(opts) -- calling setup is optional
    vim.api.nvim_create_autocmd("ColorScheme", {
      pattern = "*",
      callback = function()
        vim.api.nvim_set_hl(0, "NeoTreeGitAdded", { fg = "#96ff2E" })
        vim.api.nvim_set_hl(0, "NeoTreeGitDeleted", { fg = "#F92672" })
        vim.api.nvim_set_hl(0, "NeoTreeGitModified", { fg = "#66D9EF" })
        vim.api.nvim_set_hl(0, "NeoTreeGitRenamed", { fg = "#FFD700" })
        vim.api.nvim_set_hl(0, "NeoTreeGitUntracked", { fg = "#96d22E" })
        vim.api.nvim_set_hl(0, "NeoTreeGitIgnored", { fg = "#75715E" })
        vim.api.nvim_set_hl(0, "NeoTreeDirectoryIcon", { fg = "#FFD700" })
        vim.api.nvim_set_hl(0, "NeoTreeDirectoryName", { fg = "#fafaff" })
        vim.api.nvim_set_hl(0, "NeoTreeFileName", { fg = "#fafaff" })
      end,
    })
    -- vim.cmd([[colorscheme tokyodark]])
  end,
}
