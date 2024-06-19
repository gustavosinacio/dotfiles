-- Set complete menu options. See :h completeopt
vim.opt.completeopt = { "menu", "menuone", "popup" }
vim.opt.shortmess:append("c")

local lspkind = require("lspkind")
lspkind.init({})
