-- lua/config/init.lua

require("config.options")
require("config.keymaps")

-- 复制时高亮显示复制内容
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking text",
    group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
    callback = function()
        vim.hl.on_yank()
    end,
})

-- 自动跳转到含有 .envrc 的根目录
vim.api.nvim_create_autocmd("BufReadPre", {
    callback = function()
        -- 向上查找是否存在 .envrc
        local envrc_root = vim.fs.root(0, { ".envrc" })

        -- 只有在发现了 .envrc 时才触发跳转，其它文件跳过
        if envrc_root and envrc_root ~= vim.fn.getcwd() then
            -- 1. 记录跳转前的原始目录到当前 Buffer
            vim.b.original_cwd = vim.fn.getcwd()

            -- 2. 跳转到根目录
            vim.api.nvim_set_current_dir(envrc_root)

            -- 3. 触发 direnv 重载
            local status, direnv = pcall(require, "direnv")
            if status then
                vim.cmd("DirenvReload")
            end
        end
    end,
})

-- 当 Buffer 关闭或隐藏时，恢复原目录
vim.api.nvim_create_autocmd("BufLeave", {
    callback = function()
        if vim.b.original_cwd then
            vim.api.nvim_set_current_dir(vim.b.original_cwd)
            -- 清除记录
            vim.b.original_cwd = nil
        end
    end,
})
