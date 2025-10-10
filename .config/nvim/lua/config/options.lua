-- Line number settings
vim.opt.nu = true          -- enable line numbers
vim.opt.rnu = true 	       -- relative line numbers
vim.opt.scrolloff = 8      -- minimal number of screen lines to keep above and below the cursor
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8


-- Indentation settings
vim.opt.tabstop = 4        -- Number of spaces a <Tab> in file counts for
vim.opt.shiftwidth = 4     -- Number of spaces to use for autoindent
vim.opt.expandtab = false  -- Use actual tabs, not spaces
vim.opt.softtabstop = 4    -- Number of spaces that a <Tab> feels like while editing

-- Style
vim.opt.termguicolors = true -- Enables 24-bit RGB colors support

-- Undotree
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath("state") .. "/undo"
