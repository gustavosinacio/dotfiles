return {
	{
		"MunifTanjim/prettier.nvim",
		config = function()
			local prettier = require("prettier")

			prettier.setup({
				bin = "prettier", -- or `'prettierd'` (v0.23.3+)
				filetypes = {
					"css",
					"graphql",
					"html",
					"javascript",
					"javascriptreact",
					"json",
					"less",
					"markdown",
					"scss",
					"typescript",
					"typescriptreact",
					"yaml",
				},
				cli_options = {
					arrow_parens = "always",
					bracket_spacing = true,
					bracket_same_line = false,
					embedded_language_formatting = "auto",
					end_of_line = "lf",
					html_whitespace_sensitivity = "css",
					-- jsx_bracket_same_line = false,
					jsx_single_quote = false,
					print_width = 80,
					prose_wrap = "preserve",
					quote_props = "as-needed",
					semi = false,
					single_attribute_per_line = false,
					single_quote = false,
					tab_width = 2,
					trailing_comma = "es5",
					use_tabs = false,
					vue_indent_script_and_style = false,
				},
			})
		end,
	},
	{
		"nvimtools/none-ls.nvim",
		config = function()
			local null_ls = require("null-ls")
			local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

			null_ls.setup({
				on_attach = function(client, bufnr)
					if client.supports_method("textDocument/formatting") then
						vim.keymap.set("n", "<leader>f", function()
							vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
						end, { buffer = bufnr, desc = "[F]ormat" })

						vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
						vim.api.nvim_create_autocmd("BufWritePre", {
							group = augroup,
							buffer = bufnr,
							callback = function()
								vim.lsp.buf.format({ async = false })
							end,
						})
					end

					if client.supports_method("textDocument/rangeFormatting") then
						vim.keymap.set("x", "<leader>f", function()
							vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
						end, { buffer = bufnr, desc = "[lsp] format" })
					end
				end,
				sources = {
					-- require("none-ls.diagnostics.eslint"), -- requires none-ls-extras.nvim
					-- null_ls.builtins.diagnostics.eslint_d,
					null_ls.builtins.formatting.stylua,
					null_ls.builtins.formatting.prettier,
					null_ls.builtins.formatting.gofumpt,
					null_ls.builtins.formatting.goimports,
					null_ls.builtins.formatting.golines,
				},
			})
		end,
	},
}
