-- NOTE: yank highlight
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    vim.api.nvim_set_hl(
      0,
      "IncSearch",
      { fg = "#000000", bg = "#96d22E", bold = true }
    )
  end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("custom-highlight-yank", {
    clear = true,
  }),
  callback = function()
    vim.highlight.on_yank({
      higroup = "IncSearch",
      timeout = 100,
    })
  end,
})
