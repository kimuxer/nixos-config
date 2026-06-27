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
