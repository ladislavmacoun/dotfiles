return {
	{
		"mbbill/undotree",
		cmd = "UndotreeToggle",  -- Lazy-load on demand
		keys = {
			{ "<leader>u", "<cmd>UndotreeToggle<CR>", desc = "Toggle UndoTree" },
		},
		config = function()
			-- optional settings
			vim.g.undotree_SetFocusWhenToggle = 1       -- focus when opened
			vim.g.undotree_WindowLayout = 2             -- diff panel on the right
			vim.g.undotree_DiffpanelHeight = 10
			vim.g.undotree_SplitWidth = 35
			vim.g.undotree_TreeNodeShape = "●"
			vim.g.undotree_TreeVertShape = "│"
			vim.g.undotree_TreeSplitShape = "╱"
			vim.g.undotree_TreeReturnShape = "╲"
		end,
	},
}
