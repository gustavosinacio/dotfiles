vim.opt.termguicolors = true

require("config.macro_recording")
require("config.yank_highlight")
require("options")
require("keymaps")

-- Source the .vimrc file
vim.cmd(
  "source " .. vim.fn.fnamemodify(vim.fn.expand("$MYVIMRC"), ":h") .. "/.vimrc"
)

require("config.lazy")

vim.cmd("colorscheme tokyonight-moon")

for _, ft_path in
  ipairs(vim.api.nvim_get_runtime_file("lua/custom/snippets/*.lua", true))
do
  loadfile(ft_path)()
end
