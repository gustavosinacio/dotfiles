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

for _, ft_path in
  ipairs(vim.api.nvim_get_runtime_file("lua/custom/snippets/*.lua", true))
do
  loadfile(ft_path)()
end

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

-- vim.cmd("colorscheme tokyonight-moon")
vim.cmd([[colorscheme catppuccin-mocha]])
