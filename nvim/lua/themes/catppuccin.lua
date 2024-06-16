return {
	"catppuccin/nvim",
	lazy = false,
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			flavour = "mocha", -- latte, frappe, macchiato, mocha
			transparent_background = true,
			integrations = {
				cmp = true,
				gitsigns = true,
				treesitter = true,
				harpoon = true,
				telescope = true,
				mason = true,
				noice = true,
				notify = true,
				which_key = true,
				fidget = true,
				native_lsp = {
					enabled = true,
					virtual_text = {
						errors = { "italic" },
						hints = { "italic" },
						warnings = { "italic" },
						information = { "italic" },
					},
					underlines = {
						errors = { "underline" },

						hints = { "underline" },
						warnings = { "underline" },
						information = { "underline" },
					},
					inlay_hints = {
						background = true,
					},
				},
				mini = {
					enabled = true,
					indentscope_color = "",
				},
			},
		})

		-- setup must be called before loading
		vim.cmd.colorscheme("catppuccin-mocha")
	end,
}
