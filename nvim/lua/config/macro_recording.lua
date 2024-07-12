vim.api.nvim_create_autocmd("RecordingLeave", {
  group = vim.api.nvim_create_augroup("custom-recording", {
    clear = true,
  }),
  desc = "show recording status",
  callback = function()
    vim.print("Finished recording '" .. vim.fn.reg_recording() .. "'")
  end,
})
