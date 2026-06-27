-- init.lua
-- 1. 加载管理器实现
require("pack")

-- 2. 加载基础配置模块
require("config.options")
require("config.keymap")
require("config.commands")

-- 3. 自动加载所有插件配置
local plugin_files = vim.fn.glob(vim.fn.stdpath("config") .. "/lua/plugins/*.lua", true, true)
for _, file in ipairs(plugin_files) do
    require("plugins." .. vim.fn.fnamemodify(file, ":t:r"))
end
