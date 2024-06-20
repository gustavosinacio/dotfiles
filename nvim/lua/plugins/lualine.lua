return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("lualine").setup({
			options = {
				theme = "tokyonight",
			},
		})

		vim.keymap.set("n", "<leader>hl", function()
			require("lualine").get_config()
		end)
	end,
}
