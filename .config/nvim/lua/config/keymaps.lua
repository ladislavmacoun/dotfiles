-- buffers
vim.keymap.set("n", "<leader>n", ":bn<cr>")
vim.keymap.set("n", "<leader>p", ":bp<cr>")
vim.keymap.set("n", "<leader>x", ":bd<cr>")
vim.keymap.set("n", "<leader>ml", ":b#<cr>")

-- yank to clipboard
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
-- yank line to clipboard
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- telescope (file search)
vim.keymap.set("n", "<leader>fs", ":Telescope find_files<cr>")
vim.keymap.set("n", "<leader>fg", ":Telescope git_files<cr>")
vim.keymap.set("n", "<leader>fz", ":Telescope live_grep<cr>")
vim.keymap.set("n", "<leader>fo", ":Telescope old_files<cr>")

-- tree
vim.keymap.set("n", "<leader>e", ":Neotree toggle<cr>")

-- Avante
vim.keymap.set("n", "<leader>aa", ":AvanteAsk<CR>", { desc = "Ask Avante" })
vim.keymap.set("n", "<leader>at", ":AvanteToggle<CR>", { desc = "Toggle Avante sidebar" })
vim.keymap.set("n", "<leader>am", ":AvanteModels<CR>", { desc = "Show model list"})
