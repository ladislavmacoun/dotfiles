-- 🏁 Set leader early
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- ⚙️ Core config
require("config.options")

-- 📦 Load lazy plugins
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable",
		"https://github.com/folke/lazy.nvim.git", lazypath })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup("plugins")

-- ⌨️ Keymaps & LSP
require("config.keymaps")
require("config.lsp")
require("config.autocmds")
