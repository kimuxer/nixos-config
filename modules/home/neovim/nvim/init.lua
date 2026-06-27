-- init.lua
-- 1. 加载管理器实现
require("pack")

-- 2. 一站式声明插件
vim.pack.add({
    "neovim/nvim-lspconfig",
    "saghen/blink.cmp",
    "folke/which-key.nvim",
    "nvim-mini/mini.files",
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-fzf-native.nvim",
    "stevearc/conform.nvim",
    "NeogitOrg/neogit",
    "neovim-treesitter/nvim-treesitter",
    "folke/tokyonight.nvim",
    "folke/noice.nvim",
})

-- 3. 加载基础配置模块
require("config.options")
require("config.keymap")
require("config.commands")

-- 4. 自动加载所有插件配置
local plugin_files = vim.fn.glob(vim.fn.stdpath("config") .. "/lua/plugins/*.lua", true, true)
for _, file in ipairs(plugin_files) do
    require("plugins." .. vim.fn.fnamemodify(file, ":t:r"))
end
