-- lua/commands.lua

vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking text",
    group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
    callback = function()
        vim.hl.on_yank()
    end,
})

-- vim.api.nvim_create_autocmd('FileType', {
--     pattern = '*',
--     callback = function()
--         -- 高亮 (Neovim 默认通常已开启，但这行是显式调用)
--         pcall(vim.treesitter.start)

-- 折叠 (如果你喜欢用 TS 引擎控制折叠)
--        vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
--        vim.wo.foldmethod = 'expr'
--        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
--    end,
--})
vim.pack.add({
    "https://github.com/folke/lazydev.nvim",
})
-- only load on lua files
local lazydev_config = {
    library = {
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
    },
}

local status, lazydev = pcall(require, "lazydev")
if status then
    lazydev.setup(lazydev_config)
end
