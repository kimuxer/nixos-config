require("noice").setup({
    cmdline = {
        enabled = true,
        view = "cmdline_popup",
    },

    notify = { enabled = false },

    messages = { enabled = false },

    presets = {
        command_palette = true,       -- 命令面板更紧凑
        long_message_to_split = true, -- 长消息还是切分窗口显示更好，防止阻塞编辑
    },
})
