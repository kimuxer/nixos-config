vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.swapfile = false

vim.opt.termguicolors = true

vim.opt.cursorline = true
vim.wo.relativenumber = true
vim.wo.number = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.mouse = 'a'
vim.opt.wrap = false
vim.opt.breakindent = true

vim.opt.undofile = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.scrolloff = 10

vim.opt.confirm = true
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

vim.opt.path:append("**")

vim.opt.wildignore:append({
    "*/.git/*",
    "*/build/*",
    "*/dist/*",
    "*/node_modules/*",
    "*/result*",
    "*/.direnv/*",
})
