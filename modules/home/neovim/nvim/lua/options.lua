vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.o.swapfile = false

vim.o.termguicolors = true

vim.o.cursorline = true
vim.wo.relativenumber = true
vim.wo.number = true
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = false
vim.o.mouse = 'a'
vim.opt.wrap = false
vim.o.breakindent = true

vim.o.undofile = true

vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.scrolloff = 10

vim.o.confirm = true

vim.opt.path:append("**")

vim.opt.wildignore:append({
    "*/.git/*",
    "*/build/*",
    "*/dist/*",
    "*/node_modules/*",
    "*/result*",
    "*/.direnv/*",
})
