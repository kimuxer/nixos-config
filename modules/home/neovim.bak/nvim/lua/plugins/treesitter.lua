-- lua/plugins/treesitter.lua
vim.api.nvim_create_autocmd('FileType', {
    pattern = { 'lua', 'nix', 'toml', 'yaml', 'json', 'markdown', 'rust', 'kdl', 'fish', 'ini', 'vim' },
    callback = function()
        vim.treesitter.start()
        vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
        vim.wo.foldmethod = 'expr'
    end,
})
