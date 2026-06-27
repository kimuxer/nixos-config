-- 1. 基础设置
require("mason").setup()
require("mason-lspconfig").setup()

-- 2. Blink.cmp (高性能补全)
require("blink.cmp").setup({
    keymap = {
        preset = 'enter',
        ['<Tab>'] = { 'select_next', 'snippet_forward', 'fallback' },
        ['<S-Tab>'] = { 'select_prev', 'snippet_backward', 'fallback' },
        ['<CR>'] = { 'accept', 'fallback' },
    },
    sources = {
        default = { "lsp", "path", "buffer" },
    },
})

-- 3. LSP 服务器配置
local lspconfig = require("lspconfig")
local servers = { "lua_ls", "nixd", "taplo" }

for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup({
        capabilities = require("blink.cmp").get_lsp_capabilities(),
    })
end

-- 4. 统一的 LSP 附件事件
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("lsp_attach_disable_fts", { clear = true }),
    callback = function(ev)
        -- 这里可以设置全局快捷键，例如跳转定义、查看定义等
        local opts = { buffer = ev.buf }
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    end,
})
