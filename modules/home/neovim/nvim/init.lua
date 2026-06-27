local url = function(plug)
    return "https://github.com/" .. plug
end
vim.pack.add({
    url("mason-org/mason.nvim"),
    url("WhoIsSethDaniel/mason-tool-installer.nvim"),
    url("mason-org/mason-lspconfig.nvim"),
    url("neovim/nvim-lspconfig"),
    url("saghen/blink.cmp"),
    url("folke/which-key.nvim"),
    -- telescope

    url("nvim-mini/mini.files"),
    url("nvim-telescope/telescope.nvim"),
    url("nvim-lua/plenary.nvim"),
    url("nvim-telescope/telescope-fzf-native.nvim"),
    -- oil
    url("stevearc/conform.nvim"),
    url("nvim-tree/nvim-web-devicons"),

    url("NeogitOrg/neogit"),

    url("nvim-treesitter/nvim-treesitter"),

    url("folke/tokyonight.nvim"),
    url("folke/noice.nvim"),
})

require("options")
require("plugins")
require("keymap")
require("commands")
require("lsp")
require("ui")
