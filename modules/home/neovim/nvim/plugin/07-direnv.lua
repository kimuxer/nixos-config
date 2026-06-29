-- lua/plugin/06-direnv.lua

-- 如果你通过 vim.pack 管理，请取消下面这行注释：
vim.pack.add({ "https://github.com/NotAShelf/direnv.nvim" })

require("direnv").setup({
    -- 核心功能：进入目录时自动加载
    autoload_direnv = true,

    -- 状态栏图标（如果你用 lualine，可以在 lualine 中引用 direnv.statusline()）
    statusline = {
        enabled = true,
        icon = "󱚟",
    },

    -- 快捷键设置
    keybindings = {
        allow = "<Leader>da",
        deny = "<Leader>dd",
        reload = "<Leader>dr",
        edit = "<Leader>de",
    },

    -- 通知设置
    notifications = {
        level = vim.log.levels.INFO,
        silent_autoload = true, -- 设置为 true 避免每次进入目录都弹出通知
    },
})
