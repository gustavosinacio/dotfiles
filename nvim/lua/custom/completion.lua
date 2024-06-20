-- Set complete menu options. See :h completeopt
vim.opt.completeopt = { "menu", "menuone", "popup" }
vim.opt.shortmess:append("c")

local lspkind = require("lspkind")
lspkind.init({})

local cmp = require("cmp")

-- NOTE: Read and search about the lines below
-- require("luasnip.loaders.from_vscode").load({
--   exclude = { "javascript" },
-- })

cmp.setup({
  sources = {
    { name = "nvim_lsp" },
    { name = "path" },
    { name = "buffer" },
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-s>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.abort(),
    -- ["<CR>"] = cmp.mapping.confirm({ select = true }),
  }),
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
      vim.snippet.expand(args.body)
    end,
  },
})

cmp.setup.filetype("gitcommit", {
  sources = cmp.config.sources({
    { name = "git" },
  }, {
    { name = "buffer" },
  }),
})
require("cmp_git").setup()

local ls = require("luasnip")
ls.config.set_config({
  history = false,
  updateevents = "TextChanged,TextChangedI",
})
