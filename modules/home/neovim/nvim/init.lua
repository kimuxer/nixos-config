local url = function(plug)
    return "https://github.com/" .. plug
end
vim.pack.add({
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
