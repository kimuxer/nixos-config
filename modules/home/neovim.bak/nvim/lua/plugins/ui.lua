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
    notify = { enabled = true },
    messages = { enabled = false },
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
