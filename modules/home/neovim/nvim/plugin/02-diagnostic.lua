-- lua/plugin/01-diagnostic.lua

vim.pack.add({ "https://github.com/rachartier/tiny-inline-diagnostic.nvim" })

require('tiny-inline-diagnostic').setup({
    preset = 'ghost',
    options = {
        show_source = true,
        throttle = 50,
    },
})

vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
})
