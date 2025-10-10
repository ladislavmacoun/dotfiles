return {
	-- Colorscheme
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				flavour = "frappe", -- or "mocha" for darker contrast
				integrations = {
					treesitter = true,
					native_lsp = { enabled = true },
					cmp = true,
					gitsigns = true,
					telescope = true,
					nvimtree = true,
					which_key = true,
				},
			})
			vim.cmd.colorscheme("catppuccin-frappe")
		end,
	},

	-- Bufferline
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			require("bufferline").setup({
				options = {
					diagnostics = "nvim_lsp",
					separator_style = "slant",
				},
			})
		end,
	},


	-- Fidget (LSP progress indicator)
	{
		"j-hui/fidget.nvim",
		opts = {
			-- You can add config here or leave it empty for defaults
		},
	},
}
