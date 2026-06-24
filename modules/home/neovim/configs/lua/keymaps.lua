-- configs/lua/keymaps.lua
---@diagnostic disable: undefined-global

local map = vim.keymap.set

-- 设置 leader 键为空格
vim.g.mapleader = " "

-- 快速保存
map('n', '<leader>w', ':w<CR>', { desc = "Save file" })

-- 在行之间移动（处理软换行）
map('n', 'j', 'gj')
map('n', 'k', 'gk')

-- 窗口切换
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')
