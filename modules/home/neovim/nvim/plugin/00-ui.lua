-- lua/plugin/00-ui.lua

vim.pack.add({
    "https://github.com/folke/noice.nvim",
    "https://github.com/rcarriga/nvim-notify",
    "https://github.com/sainnhe/gruvbox-material",
    "https://github.com/nvim-mini/mini.icons",
    "https://github.com/nvim-mini/mini.indentscope",
    "https://github.com/nvim-mini/mini.pairs",
    "https://github.com/nvim-mini/mini.files",
    "https://github.com/folke/lazydev.nvim",
})
require("mini.files").setup({})
require("mini.icons").setup()
require("mini.indentscope").setup()
require("mini.pairs").setup()

vim.g.gruvbox_material_enable_italic = true
vim.g.gruvbox_material_background = "hard"
vim.cmd.colorscheme("gruvbox-material")


vim.notify = require("notify")

require("noice").setup({
    cmdline = {
        enabled = true,
        view = "cmdline_popup",
        opts = {
            position = {
                row = "50%",
                col = "50%",
            },
        },
    },
    notify = { enabled = true, view = "notify" },
    messages = { enabled = false, view = "notify" },
    lsp = {
        override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
        },
    },
    presets = {
        command_palette = true,
        long_message_to_split = true,
    },
})
