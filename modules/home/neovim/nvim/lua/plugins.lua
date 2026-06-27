-- 1. 配色方案
vim.cmd([[colorscheme tokyonight]])

-- 2. Mini.files
require("mini.files").setup({})
require("which-key").setup()
require("neogit").setup()

-- 3. Conform 格式化
require("conform").setup({
    formatters_by_ft = {
        lua = { "stylua" },
        markdown = { "prettierd" },
        json = { "prettierd" },
        nix = { "nixfmt" },
        toml = { "taplo" },
        yaml = { "yamlfmt" },
    },
})

vim.api.nvim_create_autocmd("BufWritePre", {
    callback = function(args)
        require("conform").format({
            bufnr = args.buf,
            async = false,
            lsp_format = "fallback",
        })
    end,
})

-- 4. Telescope
require("telescope").setup({
    defaults = {
        path_display = { "truncate" },
        file_ignore_patterns = { "^.git/" },
    },
})
pcall(require("telescope").load_extension, "fzf")

-- 5. Tree-sitter

require("nvim-treesitter.configs").setup({
    highlight = { enable = true },
    indent = { enable = true },
})
