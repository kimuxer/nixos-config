-- configs/lua/options.lua
---@diagnostic disable: undefined-global

local opt = vim.opt

opt.number = true             -- 显示行号
opt.relativenumber = true     -- 显示相对行号
opt.mouse = 'a'               -- 启用鼠标支持
opt.ignorecase = true         -- 搜索忽略大小写
opt.smartcase = true          -- 搜索时如果包含大写字母，则智能切换为精确匹配
opt.shiftwidth = 2            -- 缩进宽度
opt.tabstop = 2               -- Tab 宽度
opt.expandtab = true          -- 将 Tab 转换为空格
opt.clipboard = 'unnamedplus' -- 使用系统剪贴板
opt.termguicolors = true      -- 启用真彩色支持
