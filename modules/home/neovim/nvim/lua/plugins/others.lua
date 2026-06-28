-- 1. 配色方案
vim.cmd([[colorscheme tokyonight]])

-- 2. mini.files, which-key, neogit
require("mini.files").setup({})
require("which-key").setup({
	icons = {
		mappings = true,
	},
})
require("neogit").setup({})
require("mini.icons").setup()
require("nvim-web-devicons").setup()
require("mini.indentscope").setup()
require("mini.pairs").setup()
