return {
  "nvim-treesitter/nvim-treesitter",
  config = function()
    require("nvim-treesitter.configs").setup({
      -- A list of parser names, or "all" (the five listed parsers should always be installed)
      ensure_installed = {
        "lua",
        "vim",
        "vimdoc",
        "go",
        "markdown",
        "markdown_inline",
        "javascript",
        "typescript",
        "css",
        "html",
        "java",
      },

      sync_install = false,
      auto_install = true,
      highlight = {
        enable = true,
        custom_captures = {
          ["styled-component"] = "Keyword",
        },
        additional_vim_regex_highlighting = false,
      },
      context_commentstring = {
        enable = true,
        enable_autocmd = false,
      },
      indent = { enable = true },
    })
  end,
}
