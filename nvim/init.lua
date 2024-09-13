vim.opt.termguicolors = true

require("config.macro_recording")
require("config.yank_highlight")
require("options")
require("keymaps")

-- Get the current folder path
local current_path = vim.fn.getcwd()

-- Source the .vimrc file
vim.cmd("source " .. current_path .. "/.vimrc")

require("config.lazy")

for _, ft_path in
  ipairs(vim.api.nvim_get_runtime_file("lua/custom/snippets/*.lua", true))
do
  loadfile(ft_path)()
end
