return {
	{
		"yetone/avante.nvim",
		build = "make", -- compiles native helpers if present
		dependencies = {
			"nvim-lua/plenary.nvim",          -- Required by Avante
			"nvim-treesitter/nvim-treesitter",-- For syntax tree context & highlighting
			"stevearc/dressing.nvim",         -- For better UI prompts & inputs
			"MunifTanjim/nui.nvim",           -- UI component framework
			"nvim-tree/nvim-web-devicons",    -- File icons (optional but recommended)
		},
		config = function()
			require("config.ai")              -- Detailed config in lua/config/ai.lua
		end,
	},
}

