-- modules/home/neovim/nvim/plugin/00-ui.lua

vim.pack.add({
    "https://github.com/sainnhe/gruvbox-material",
    "https://github.com/nvim-mini/mini.icons",
    "https://github.com/nvim-mini/mini.indentscope",
    "https://github.com/nvim-mini/mini.pairs",
    "https://github.com/nvim-mini/mini.files",
})

require("vim._core.ui2").enable()

-- 配色
vim.g.gruvbox_material_enable_italic = true
vim.g.gruvbox_material_background = "hard"
vim.cmd.colorscheme("gruvbox-material")

-- mini.nvim 系列
require("mini.icons").setup()
require("mini.files").setup({})
require("mini.indentscope").setup()
require("mini.pairs").setup()
