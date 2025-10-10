-- Load lsp-zero
local lsp_zero = require("lsp-zero")

-- Use recommended preset
lsp_zero.extend_lspconfig()

-- Mason setup
require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = {
		"gopls",
		"rust_analyzer",
		"jdtls",
		"kotlin_language_server",
		"lua_ls",
		"ts_ls",
	},
	handlers = {
		lsp_zero.default_setup,
	},
})

-- nvim-cmp autocompletion setup
local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }

cmp.setup({
	mapping = cmp.mapping.preset.insert({
		["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
		["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
		["<C-Space>"] = cmp.mapping.complete(),
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "buffer" },
		{ name = "path" },
	}),
})

-- LSP keymaps
lsp_zero.on_attach(function(_, bufnr)
	local opts = { buffer = bufnr, remap = false }
	local keymap = vim.keymap.set

	keymap("n", "gd", vim.lsp.buf.definition, opts)
	keymap("n", "K", vim.lsp.buf.hover, opts)
	keymap("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
	keymap("n", "<leader>vd", vim.diagnostic.open_float, opts)
	keymap("n", "[d", vim.diagnostic.goto_next, opts)
	keymap("n", "]d", vim.diagnostic.goto_prev, opts)
	keymap("n", "<leader>vca", vim.lsp.buf.code_action, opts)
	keymap("n", "<leader>vrr", vim.lsp.buf.references, opts)
	keymap("n", "<leader>vrn", vim.lsp.buf.rename, opts)
	keymap("i", "<C-h>", vim.lsp.buf.signature_help, opts)
end)

-- 🧩 LSP server specific setup

-- 🦫 Golang LSP
vim.lsp.config.gopls = {
	cmd = { "gopls" },
	filetypes = { "go", "gomod", "gowork", "gotmpl" },
	root_markers = { "go.work", "go.mod", ".git" },
}

-- 🦀 Rust LSP
vim.lsp.config.rust_analyzer = {
	cmd = { "rust-analyzer" },
	filetypes = { "rust" },
	root_markers = { "Cargo.toml", "rust-project.json", ".git" },
}

-- ☕️ Java and Kotlin
vim.lsp.config.jdtls = {
	cmd = { "jdtls" },
	filetypes = { "java" },
	root_markers = { "pom.xml", "build.gradle", ".git" },
}
vim.lsp.config.kotlin_language_server = {
	cmd = {
		"env",
		"JAVA_HOME=" .. os.getenv("SDKMAN_CANDIDATES_DIR") .. "/java/21.0.8-amzn",
		"PATH=" .. os.getenv("SDKMAN_CANDIDATES_DIR") .. "/java/21.0.8-amzn/bin:" .. os.getenv("PATH"),
		"kotlin-language-server",
	},
	filetypes = { "kotlin" },
	root_markers = { "settings.gradle", "settings.gradle.kts", "build.gradle", "build.gradle.kts", ".git" },
}

-- TypeScript / React / Next.js
vim.lsp.config.ts_ls = {
	cmd = { "typescript-language-server", "--stdio" },
	filetypes = {
		"typescript",
		"typescriptreact",
		"typescript.tsx",
		"javascript",
		"javascriptreact",
		"javascript.jsx",
	},
	root_markers = {
		"package.json",
		"tsconfig.json",
		"jsconfig.json",
		".git",
	},
	init_options = {
		hostInfo = "neovim",
	},
}

-- Lua (for Neovim config development)
vim.lsp.config.lua_ls = {
	cmd = { "lua-language-server" },
	filetypes = { "lua" },
	root_markers = { ".luarc.json", ".luacheckrc", ".git" },
	settings = {
		Lua = {
			runtime = { version = "LuaJIT" },
			diagnostics = { globals = { "vim" } },
			workspace = { checkThirdParty = false },
			telemetry = { enable = false },
		},
	},
}

-- Start servers automatically when matching filetypes are opened
for name, config in pairs(vim.lsp.config) do
	if type(config) == "table" and config.filetypes then
		vim.api.nvim_create_autocmd("FileType", {
			pattern = config.filetypes,
			callback = function()
				vim.lsp.start(config)
			end,
		})
	end
end

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		-- Guard against missing data
		if not (args.data and args.data.client_id) then
			return
		end

		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if client and client.server_capabilities.semanticTokensProvider then
			vim.lsp.semantic_tokens.start(args.buf, client.id)
		end
	end,
})
