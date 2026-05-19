local avante = require("avante")
avante.setup({
	provider = "claude-code",
	auto_apply_edits = false,
	show_diff = true,
})

-- Safety: make buffer modifiable before edits if needed
vim.api.nvim_create_autocmd("User", {
	pattern = { "AvanteStart", "AvanteEdit", "AvanteApply" },
	callback = function()
		local buf = vim.api.nvim_get_current_buf()
		-- only force modifiable if it's currently not modifiable
		if not vim.bo[buf].modifiable then
			vim.bo[buf].modifiable = true
			vim.bo[buf].readonly = false
		end
	end,
})
