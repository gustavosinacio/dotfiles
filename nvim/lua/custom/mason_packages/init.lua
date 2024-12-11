local go = require("custom.LSPs.go")
local lua = require("custom.LSPs.lua")
local js = require("custom.LSPs.js")
local bash = require("custom.LSPs.bash")
local LSPs = {
  pyright = {},
  taplo = {},
  yamlls = {},
}

LSPs = vim.tbl_deep_extend("force", LSPs, go)
LSPs = vim.tbl_deep_extend("force", LSPs, lua)
LSPs = vim.tbl_deep_extend("force", LSPs, js)
LSPs = vim.tbl_deep_extend("force", LSPs, bash)

local formattersAndLinters = {
  "stylua",
  "prettier",
  "gofumpt",
  "goimports",
  "golines",
  "black",
  "shfmt",
  -- "yamlfix",
  -- "yamlfmt",
}

local codeActions = {
  "gomodifytags",
  "impl",
}

local diagnostics = {
  -- "eslint",
  "yamllint",
}

local disableFormattingLSPs = {
  "tsserver",
  "ts_ls",
  "typescript-tools",
  "typescript-language-server",
  "bashls",
}

local ensure_installed = vim.tbl_keys(LSPs or {})
vim.list_extend(ensure_installed, formattersAndLinters)
vim.list_extend(ensure_installed, codeActions)
vim.list_extend(ensure_installed, diagnostics)

require("mason-tool-installer").setup({
  ensure_installed = ensure_installed,
})

vim.keymap.set("n", "<leader>tg", function()
  vim.print(ensure_installed)
end)

return {
  LSPs = LSPs,
  formattersAndLinters = formattersAndLinters,
  codeActions = codeActions,
  diagnostics = diagnostics,
  disableFormattingLSPs = disableFormattingLSPs,
}
