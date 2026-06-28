-- 1. Blink.cmp 配置
require("blink.cmp").setup({
	keymap = {
		preset = "enter",
		["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
		["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
		["<CR>"] = { "accept", "fallback" },
	},
	sources = {
		default = { "lsp", "path", "buffer" },
	},
})

-- 2. LSP 服务器配置
local capabilities = require("blink.cmp").get_lsp_capabilities()

vim.lsp.config("lua_ls", {
	capabilities = capabilities,
	root_dir = function(bufnr, cb)
		local fname = vim.api.nvim_buf_get_name(bufnr)
		cb(vim.fs.root(fname, { ".git", ".luarc.json", ".luarc.jsonc" }) or vim.fn.stdpath("config"))
	end,
	settings = {
		Lua = {
			codeLens = { enable = true },
			hint = { enable = true, semicolon = "Disable" },
		},
	},
})

vim.lsp.config("rust_analyzer", {
	capabilities = capabilities,
	settings = {
		["rust-analyzer"] = {
			cargo = { allFeatures = false },
			checkOnSave = { command = "clippy" },
		},
	},
})

for _, lsp in ipairs({ "nixd", "taplo" }) do
	vim.lsp.config(lsp, { capabilities = capabilities })
end

vim.lsp.enable({ "lua_ls", "nixd", "taplo", "rust_analyzer" })

-- 3. LSP 快捷键
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("lsp_attach", { clear = true }),
	callback = function(ev)
		local opts = { buffer = ev.buf }
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
	end,
})
