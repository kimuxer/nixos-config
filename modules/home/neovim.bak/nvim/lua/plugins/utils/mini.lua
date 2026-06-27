vim.pack.add({ { src = "https://github.com/echasnovski/mini.nvim", name = "mini" } })

-- UI & Core
require("mini.statusline").setup()
require("mini.icons").setup()
require("mini.pairs").setup()
require("mini.ai").setup()
require("mini.cursorword").setup()
require("mini.surround").setup()

-- Tools
require("mini.pick").setup()
require("mini.extra").setup()
require("mini.files").setup()
require("mini.sessions").setup({
    autoread = true,
    autowrite = true,
    file = ".session",
    force = { read = false, write = true, delete = true },
})

-- Editing & Utils
require("mini.trailspace").setup()
require("mini.move").setup({
    mappings = { down = "J", up = "K" },
})

-- Visual
require("mini.indentscope").setup({
    symbol = "│",
    draw = { delay = 10 },
})

require("mini.animate").setup()

require("mini.clue").setup({
    triggers = {
        -- Leader triggers
        { mode = 'n', keys = '<Leader>' },
        { mode = 'x', keys = '<Leader>' },
        -- Built-in completion
        { mode = 'i', keys = '<C-x>' },
        -- Window commands
        { mode = 'n', keys = '<C-w>' },
        -- Tabs
        { mode = 'n', keys = '<C-t>' },
    },
    clues = {
        -- 自动提示 mini 模块和一些常用快捷键
        require("mini.clue").gen_clues.builtin_completion(),
        require("mini.clue").gen_clues.g(),
        require("mini.clue").gen_clues.marks(),
        require("mini.clue").gen_clues.registers(),
        require("mini.clue").gen_clues.windows(),
    },
})
