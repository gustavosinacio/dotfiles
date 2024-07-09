vim.cmd([[
  autocmd BufRead,BufNewFile sketchybarrc setfiletype sh
]])

return {
  bashls = {
    settings = {
      format = {
        enable = false,
      },
    },
  },
}
