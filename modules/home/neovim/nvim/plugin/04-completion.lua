-- modules/home/neovim/nvim/plugin/04-completion.lua

-- 1. 通过 vim.pack 安装 Nix 中未包含的 Lua 插件
vim.pack.add({
    "https://github.com/rafamadriz/friendly-snippets",
})

-- 2. 补全引擎配置
-- 注意：blink-cmp 由 Nix 提供，所以直接 setup 即可
local blink = require("blink.cmp")

blink.setup({
    snippets = { preset = "default" },
    keymap = {
        preset = "enter",
        ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
        ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
        ["<CR>"] = { "accept", "fallback" },
    },
    sources = { default = { "lsp", "path", "snippets", "buffer" } },
    completion = {
        documentation = { auto_show = true, auto_show_delay_ms = 500, window = { border = "rounded" } },
    },
    signature = { enabled = true },
})
