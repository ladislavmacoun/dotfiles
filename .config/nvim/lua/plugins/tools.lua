return {
	-- Telescope
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	-- Neo-tree
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		lazy = false,
		opts = {
			filesystem = {
				filtered_items = {
					visible = true,           -- Show filtered items (dotfiles + untracked)
					hide_dotfiles = false,    -- Don't hide dotfiles
					hide_gitignored = false,  -- Show gitignored files
					hide_by_name = {},        -- You can explicitly hide certain files here
					never_show = {},          -- And permanently hide specific ones
				},
				follow_current_file = {
					enabled = true,
				},
				group_empty_dirs = true,
			},
		},
	},
	-- Git blame info
	{
		"f-person/git-blame.nvim",
		event = "VeryLazy",
		opts = {
			enabled = false,
			message_template = " <summary> • <date> • <author> • <<sha>>",
			date_format = "%m-%d-%Y %H:%M:%S",
			virtual_text_column = 1,
		},
	}
}
