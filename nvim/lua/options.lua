vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
-- vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
vim.opt.listchars = {
  tab = "· ",
  trail = "·",
  nbsp = "␣",
}

vim.o.inccommand = "split"
vim.o.signcolumn = "auto:1-4"
