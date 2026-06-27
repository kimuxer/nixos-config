-- 7. Tiny-inline-diagnostic
require('tiny-inline-diagnostic').setup({
    preset = 'ghost',       -- 默认样式：鬼影般的轻量提示
    options = {
        show_source = true, -- 显示报错来源 (例如: lua_ls)
        throttle = 50,      -- 刷新频率，减少资源占用
    },
})
