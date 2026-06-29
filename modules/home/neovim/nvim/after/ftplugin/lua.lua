-- after/ftplugin/lua.lua

-- 1. 只有打开 Lua 文件时才开启 lua_ls
local capabilities = _G.LSP_CAPS or require("blink.cmp").get_lsp_capabilities()

vim.lsp.config("lua_ls", {
    capabilities = capabilities,
    root_dir = function(bufnr, cb)
        local fname = vim.api.nvim_buf_get_name(bufnr)
        cb(vim.fs.root(fname, { '.git', '.luarc.json', '.luarc.jsonc' })
            or vim.fn.stdpath('config'))
    end,
    settings = {
        Lua = {
            codeLens = { enable = true },
            hint = { enable = true, semicolon = 'Disable' },
        },
    },
})

vim.lsp.enable("lua_ls")

-- 2. 设置本地缩进
vim.opt_local.shiftwidth = 2
vim.opt_local.tabstop = 2
