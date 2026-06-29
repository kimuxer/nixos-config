-- lua/plugin/08-whichkey.lua
vim.schedule(function()
    vim.pack.add({ "https://github.com/folke/which-key.nvim" })

    local wk = require("which-key")
    wk.setup({
        spec = { { "<Esc><Esc>", hidden = true } },
    })
end)
