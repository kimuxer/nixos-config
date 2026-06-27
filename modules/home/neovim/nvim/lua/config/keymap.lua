vim.keymap.set(
    "n",
    "-",
    "<CMD>lua MiniFiles.open()<CR>",
    { desc = "Open Current directory in MiniFiles" }
)

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "[S] Find files]" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "[G]rep across files" })
vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find buffers]" })

-- conform
vim.keymap.set("n", "<leader>fm", function()
    require("conform").format({ async = true, lsp_format = "fallback" })
end, { desc = "[M]ormat buffer" })

-- neogit

vim.keymap.set("n", "<leader>gg", "<cmd>Neogit<cr>", { desc = "Show Neogit UI" })

-- 系统剪贴板
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank to system clipboard" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Yank line to system clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>p", [["+p]], { desc = "Paste from system clipboard" })
