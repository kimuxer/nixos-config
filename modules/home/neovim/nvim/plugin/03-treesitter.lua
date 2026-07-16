-- modules/home/neovim/nvim/plugin/03-treesitter.lua

-- 1. 使用 vim.pack 安装
vim.pack.add({
    "https://github.com/neovim-treesitter/treesitter-parser-registry",
    "https://github.com/neovim-treesitter/nvim-treesitter",
})

-- 2. 安装解析器 ，调用系统的 tree-sitter CLI
local parsers = { "kdl", "lua", "markdown", "markdown_inline", "nix", "rust", "vim", "vimdoc" }

require("nvim-treesitter").install(parsers)

-- 3. 开启特性 (每个语言手动开启)
vim.api.nvim_create_autocmd("FileType", {
    pattern = parsers,
    callback = function()
        vim.treesitter.start()                                            -- 开启高亮
        vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"               -- 开启折叠
        vim.wo.foldmethod = "expr"
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()" -- 开启缩进
    end,
})
