return {
  {
    "nvimtools/none-ls.nvim",
    dependencies = {
      {
        "williamboman/mason.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        "nvimtools/none-ls-extras.nvim",
      },
    },
    config = function()
      local null_ls = require("null-ls")
      local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

      local LSPsAndFormatters = require("custom.mason_packages")
      local formattersAndLinters = LSPsAndFormatters.formattersAndLinters
      local codeActions = LSPsAndFormatters.codeActions
      local diagnostics = LSPsAndFormatters.diagnostics

      local sources = {}

      for _, name in ipairs(formattersAndLinters) do
        table.insert(sources, null_ls.builtins.formatting[name])
      end

      for _, name in ipairs(codeActions) do
        table.insert(sources, null_ls.builtins.code_actions[name])
      end

      for _, name in ipairs(diagnostics) do
        table.insert(sources, require("none-ls.diagnostics." .. name))
      end

      local function filterServers(client, excluded_names)
        for _, name in ipairs(excluded_names) do
          if client.name == name then
            return false
          end
        end
        return true
      end

      local filterServerNames = { "tsserver" }

      null_ls.setup({
        on_attach = function(client, bufnr)
          if client.supports_method("textDocument/formatting") then
            vim.keymap.set("n", "<leader>f", function()
              vim.lsp.buf.format({
                bufnr = vim.api.nvim_get_current_buf(),
                -- Exclude listed formatters from LSP servers
                -- This is done to avoid multiple formatting
                filter = function(client)
                  return filterServers(client, filterServerNames)
                end,
              })
            end, {
              buffer = bufnr,
              desc = "[F]ormat",
            })

            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
              group = augroup,
              buffer = bufnr,
              callback = function()
                vim.lsp.buf.format({
                  async = false,
                  -- Exclude listed formatters from LSP servers
                  -- This is done to avoid multiple formatting
                  filter = function(client)
                    return filterServers(client, filterServerNames)
                  end,
                })
              end,
            })
          end

          if client.supports_method("textDocument/rangeFormatting") then
            vim.keymap.set("x", "<leader>f", function()
              vim.lsp.buf.format({
                bufnr = vim.api.nvim_get_current_buf(),
                -- Exclude listed formatters from LSP servers
                -- This is done to avoid multiple formatting
                filter = function(client)
                  return filterServers(client, filterServerNames)
                end,
              })
            end, {
              buffer = bufnr,
              desc = "[LSP] format",
            })
          end
        end,
        sources = sources,
      })
    end,
  },
}
