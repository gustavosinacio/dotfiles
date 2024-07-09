local LSPs = {
  pyright = {},
  taplo = {},
  yamlls = {},
}
local go = require("custom.LSPs.go")
local lua = require("custom.LSPs.lua")
local js = require("custom.LSPs.js")
local bash = require("custom.LSPs.bash")

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
  "eslint_d",
  "yamllint",
}

-- Ensure the servers and tools above are installed
--  To check the current status of installed tools and/or manually install
--  other tools, you can run
--    :Mason
-- You can add other tools here that you want Mason to install
-- for you, so that they are available from within Neovim.
local ensure_installed = vim.tbl_keys(LSPs or {})
vim.list_extend(ensure_installed, formattersAndLinters)
vim.list_extend(ensure_installed, codeActions)
vim.list_extend(ensure_installed, diagnostics)

vim.print(ensure_installed)

require("mason-tool-installer").setup({
  ensure_installed = ensure_installed,
})


return {
  LSPs = LSPs,
  formattersAndLinters = formattersAndLinters,
  codeActions = codeActions,
  diagnostics = diagnostics,
}
