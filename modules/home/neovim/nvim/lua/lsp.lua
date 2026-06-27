-- 1. Blink.cmp (高性能补全)
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

-- 2. LSP 服务器配置
local lspconfig = require("lspconfig")
local servers = { "lua_ls", "nixd", "taplo" }

for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup({
        capabilities = require("blink.cmp").get_lsp_capabilities(),
    })
end

-- 3. 统一的 LSP 附件事件
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("lsp_attach_disable_fts", { clear = true }),
    callback = function(ev)
        -- 这里可以设置全局快捷键，例如跳转定义、查看定义等
        local opts = { buffer = ev.buf }
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    end,
})

vim.diagnostic.config({
    virtual_text = false, -- 禁用原生的行内提示，因为有 tiny-inline-diagnostic 了
    signs = true,         -- 保留左侧的图标标识
    underline = true,     -- 保留波浪线
})
