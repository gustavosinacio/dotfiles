return { -- LSP Configuration & Plugins
  "neovim/nvim-lspconfig",
  dependencies = {
    -- Automatically install LSPs and related tools to stdpath for Neovim
    {
      "williamboman/mason.nvim",
      config = true,
    }, -- NOTE: Must be loaded before dependants
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",

    -- Useful status updates for LSP.
    -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
    { "j-hui/fidget.nvim",    opts = {} },

    -- `neodev` configures Lua LSP for your Neovim config, runtime and plugins
    -- used for completion, annotations and signatures of Neovim apis
    {
      "folke/lazydev.nvim",
      ft = "lua",
      opts = {
        library = {
          -- Load luvit types when the `vim.uv` word is found
          { path = "luvit-meta/library", words = { "vim%.uv" } },
        },
      },
    },
    { "Bilal2453/luvit-meta", lazy = true },
  },
  config = function()
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup(
        "custom-lsp-attach",
        { clear = true }
      ),
      callback = function(event)
        -- Function that lets us more easily define mappings specific
        -- for LSP related items. It sets the mode, buffer and description for us each time.
        local map = function(keys, func, desc)
          vim.keymap.set(
            "n",
            keys,
            func,
            { buffer = event.buf, desc = "LSP: " .. desc }
          )
        end

        -- Jump to the definition of the word under your cursor.
        --  This is where a variable was first declared, or where a function is defined, etc.
        --  To jump back, press <C-t>.
        map(
          "gd",
          require("telescope.builtin").lsp_definitions,
          "[G]oto [D]efinition"
        )

        -- Find references for the word under your cursor.
        map(
          "gr",
          require("telescope.builtin").lsp_references,
          "[G]oto [R]eferences"
        )

        -- Jump to the implementation of the word under your cursor.
        --  Useful when your language has ways of declaring types without an actual implementation.
        map(
          "gI",
          require("telescope.builtin").lsp_implementations,
          "[G]oto [I]mplementation"
        )

        -- Jump to the type of the word under your cursor.
        --  Useful when you're not sure what type a variable is and you want to see
        --  the definition of its *type*, not where it was *defined*.
        map(
          "<leader>D",
          require("telescope.builtin").lsp_type_definitions,
          "Type [D]efinition"
        )

        -- Fuzzy find all the symbols in your current document.
        --  Symbols are things like variables, functions, types, etc.
        map(
          "<leader>ds",
          require("telescope.builtin").lsp_document_symbols,
          "[D]ocument [S]ymbols"
        )

        -- Fuzzy find all the symbols in your current workspace.
        --  Similar to document symbols, except searches over your entire project.
        map(
          "<leader>ws",
          require("telescope.builtin").lsp_dynamic_workspace_symbols,
          "[W]orkspace [S]ymbols"
        )

        -- Rename the variable under your cursor.
        --  Most Language Servers support renaming across files, etc.
        map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")

        -- Execute a code action, usually your cursor needs to be on top of an error
        -- or a suggestion from your LSP for this to activate.
        map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

        -- Opens a popup that displays documentation about the word under your cursor
        --  See `:help K` for why this keymap.
        map("K", vim.lsp.buf.hover, "Hover Documentation")

        -- WARN: This is not Goto Definition, this is Goto Declaration.
        --  For example, in C this would take you to the header.
        map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client.server_capabilities.documentHighlightProvider then
          local highlight_augroup = vim.api.nvim_create_augroup(
            "custom-lsp-highlight",
            { clear = false }
          )

          -- The following two autocommands are used to highlight references of the
          -- word under your cursor when your cursor rests there for a little while.
          --    See `:help CursorHold` for information about when this is executed
          vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.document_highlight,
          })

          -- When you move your cursor, the highlights will be cleared
          vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.clear_references,
          })

          vim.api.nvim_create_autocmd("LspDetach", {
            group = vim.api.nvim_create_augroup(
              "custom-lsp-detach",
              { clear = true }
            ),
            callback = function(event2)
              vim.lsp.buf.clear_references()
              vim.api.nvim_clear_autocmds({
                group = "custom-lsp-highlight",
                buffer = event2.buf,
              })
            end,
          })
        end
      end,
    })

    require("mason").setup({
      ui = {
        icons = {
          package_installed = "✓✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    -- LSP servers and clients are able to communicate to each other what features they support.
    --  By default, Neovim doesn't support everything that is in the LSP specification.
    --  When you add nvim-cmp, luasnip, etc. Neovim now has *more* capabilities.
    --  So, we create new capabilities with nvim cmp, and then broadcast that to the servers.
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = vim.tbl_deep_extend(
      "force",
      capabilities,
      require("cmp_nvim_lsp").default_capabilities()
    )

    local servers = {
      pyright = {},
      bashls = {},
      taplo = {},
      yamlls = {},
    }

    local go = require("custom.LSPs.go")
    local lua = require("custom.LSPs.lua")
    local js = require("custom.LSPs.js")

    servers = vim.tbl_deep_extend("force", servers, go)
    servers = vim.tbl_deep_extend("force", servers, lua)
    servers = vim.tbl_deep_extend("force", servers, js)

    -- Ensure the servers and tools above are installed
    --  To check the current status of installed tools and/or manually install
    --  other tools, you can run
    --    :Mason
    -- You can add other tools here that you want Mason to install
    -- for you, so that they are available from within Neovim.
    local ensure_installed = vim.tbl_keys(servers or {})
    require("mason-tool-installer").setup({
      ensure_installed = ensure_installed,
    })

    require("mason-lspconfig").setup({
      handlers = {
        function(server_name)
          local server = servers[server_name] or {}
          -- This handles overriding only values explicitly passed
          -- by the server configuration above. Useful when disabling
          -- certain features of an LSP (for example, turning off formatting for tsserver)
          server.capabilities = vim.tbl_deep_extend(
            "force",
            {},
            capabilities,
            server.capabilities or {}
          )

          require("lspconfig")[server_name].setup(server)
        end,
      },
    })

    -- Change the behavior of the disgnostic information display
    vim.diagnostic.config({
      virtual_text = true,
      signs = true,
      underline = true,
      update_in_insert = true,
      severity_sort = false,
    })
  end,
}
