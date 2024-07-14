local watched_file = "testground.lua"
local path_to_file = "testground.lua"

vim.api.nvim_create_autocmd("BufWritePost", {
  group = vim.api.nvim_create_augroup("testground-debbug", { clear = true }),
  pattern = watched_file,
  callback = function()
    local file_dir = vim.fn.fnamemodify(vim.fn.expand("<afile>"), ":p:h")
    dofile(file_dir .. "/" .. path_to_file)
  end,
})
