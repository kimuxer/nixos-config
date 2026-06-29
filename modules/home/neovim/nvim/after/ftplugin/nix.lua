-- after/ftplugin/nix.lua

-- 1. 确保 LSP 在打开 .nix 文件时启动
local capabilities = _G.LSP_CAPS or require("blink.cmp").get_lsp_capabilities()

vim.lsp.config("nixd", {
    -- capabilities = _G.LSP_CAPS or {},
    capabilities = capabilities,
    settings = {
        nixd = {
            nixpkgs = {
                -- 自动指向当前 flake 的输入
                expr = "builtins.getFlake \"" .. (vim.env.PRJ_ROOT or ".") .. "\"",
            },
            formatting = {
                command = { "nixfmt" },
            },
        },
    },
})
vim.lsp.enable("nixd")

-- 2. 格式化设置 (conform.nvim 会自动读取这里的配置)
-- 如果你使用 conform，它会自动寻找 formatters_by_ft 中的 nix = { "nixfmt" }
-- 你也可以在这里设置本地的缓冲区选项
vim.opt_local.shiftwidth = 2
vim.opt_local.tabstop = 2
vim.opt_local.expandtab = true
