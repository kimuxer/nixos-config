vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.swapfile = false

vim.o.termguicolors = true

vim.o.number = true

vim.o.relativenumber = true

vim.o.mouse = 'a'

vim.o.showmode = false

vim.o.breakindent = true

vim.o.undofile = true

vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.cursorline = true

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
