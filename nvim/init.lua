require("config.macro_recording")
require("config.yank_highlight")
require("options")
require("keymaps")

vim.cmd("source ~/.config/nvim/.vimrc")

require("config.lazy")

for _, ft_path in
  ipairs(vim.api.nvim_get_runtime_file("lua/custom/snippets/*.lua", true))
do
  loadfile(ft_path)()
end
