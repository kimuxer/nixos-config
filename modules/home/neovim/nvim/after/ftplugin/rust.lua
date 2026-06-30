-- after/ftplugin/rust.lua

-- 确保 LSP 配置只设置一次，且使用全局变量
-- 使用 pcall 确保如果 _G.LSP_CAPS 还没定义，不会报错
local capabilities = _G.LSP_CAPS or require("blink.cmp").get_lsp_capabilities()

vim.lsp.config("rust_analyzer", {
    capabilities = capabilities,
    settings = {
        ["rust-analyzer"] = {
            cargo = { allFeatures = false },
            checkOnSave = { command = "clippy" },
        },
    },
})

-- 启动 LSP
vim.lsp.enable("rust_analyzer")

-- === 新增：为当前 Rust Buffer 设置 formatting ===
require("conform").formatters_by_ft.rust = { "rustfmt" }
