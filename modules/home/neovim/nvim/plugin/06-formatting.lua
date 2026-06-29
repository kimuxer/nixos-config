-- lua/plugin/02-formatting.lua
vim.pack.add({ "https://github.com/stevearc/conform.nvim" })

require("conform").setup({
    formatters_by_ft = {
        lua = { "stylua" },
        markdown = { "prettierd" },
        json = { "prettierd" },
        nix = { "nixfmt" },
        toml = { "taplo" },
        yaml = { "yamlfmt" },
        rust = { "rustfmt" },
    },
    default_format_opts = {
        lsp_format = "fallback",
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
