vim.api.nvim_create_autocmd("BufEnter", {
	group = vim.api.nvim_create_augroup("CloseNeoTreeOnLastWindow", { clear = true }),
	callback = function()
		local win_count = #vim.api.nvim_list_wins()
		if win_count == 1 then
			local bufname = vim.api.nvim_buf_get_name(0)
			if bufname:match("neo%-tree") then
				vim.cmd("quit")
			end
		end
	end,
})
