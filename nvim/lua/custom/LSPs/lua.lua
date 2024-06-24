return {
  lua_ls = {
    settings = {
      Lua = {
        format = {
          enable = true,
        },
        completion = {
          callSnippet = "Replace",
        },
        -- diagnostics = { disable = { 'missing-fields' } },
      },
    },
  },
  stylua = {},
}
