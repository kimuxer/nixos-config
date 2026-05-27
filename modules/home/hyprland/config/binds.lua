local mod = "SUPER"

-- === 应用启动 (使用 hl.dsp.exec_cmd) ===
hl.bind(mod .. "+Return", hl.dsp.exec_cmd("kitty"))
hl.bind(mod .. "+D", hl.dsp.exec_cmd("dms ipc call spotlight toggle"))
hl.bind(mod .. "+B", hl.dsp.exec_cmd("zen --class zen-browser"))
hl.bind(mod .. "+E", hl.dsp.exec_cmd("kitty -e yazi"))

-- === DMS 快捷功能 ===
hl.bind(mod .. "+V", hl.dsp.exec_cmd("dms ipc call clipboard toggle"))
hl.bind(mod .. "+N", hl.dsp.exec_cmd("dms ipc call notifications toggle"))
hl.bind(mod .. "+M", hl.dsp.exec_cmd("dms ipc call processlist focusOrToggle"))
hl.bind(mod .. "+Y", hl.dsp.exec_cmd("dms ipc call dankdash wallpaper"))
hl.bind(mod .. "+semicolon", hl.dsp.exec_cmd("dms ipc call settings focusOrToggle"))

-- === 窗口控制 ===
hl.bind(mod .. "+Q", hl.dsp.window.kill())
hl.bind(mod .. "+T", hl.dsp.window.float())
hl.bind(mod .. "+F", hl.dsp.window.fullscreen({ action = "toggle" }))
hl.bind(mod .. "+W", hl.dsp.group.toggle())
hl.bind(mod .. "+comma", hl.dsp.group.move_window({ direction = "l" }))
hl.bind(mod .. "+period", hl.dsp.group.move_window({ direction = "r" }))

-- === 会话与截图 ===
hl.bind("ALT+L", hl.dsp.exec_cmd("dms ipc call lock lock"))
hl.bind(mod .. "+SHIFT+Q", hl.dsp.exec_cmd("dms ipc call shell powermenu"))
hl.bind("CTRL+SHIFT+1", hl.dsp.exec_cmd("dms screenshot"))
hl.bind("CTRL+SHIFT+2", hl.dsp.exec_cmd("dms screenshot full"))
hl.bind("CTRL+SHIFT+3", hl.dsp.exec_cmd("dms screenshot last"))

-- === 焦点与移动 (HJKL) ===
hl.bind(mod .. "+H", hl.dsp.focus({ direction = "l" }))
hl.bind(mod .. "+L", hl.dsp.focus({ direction = "r" }))
hl.bind(mod .. "+K", hl.dsp.focus({ direction = "u" }))
hl.bind(mod .. "+J", hl.dsp.focus({ direction = "d" }))

hl.bind(mod .. "+SHIFT+H", hl.dsp.window.swap({ direction = "l" }))
hl.bind(mod .. "+SHIFT+L", hl.dsp.window.swap({ direction = "r" }))
hl.bind(mod .. "+SHIFT+K", hl.dsp.window.swap({ direction = "u" }))
hl.bind(mod .. "+SHIFT+J", hl.dsp.window.swap({ direction = "d" }))

-- === 工作区循环 ===
-- === 修改后的工作区循环 ===
for i = 1, 9 do
    local s = tostring(i)
    -- 必须显式加入 monitor = "current"，否则 API 会报错
    hl.bind(mod .. "+" .. s, hl.dsp.workspace.move({ workspace = s, monitor = "current" }))

    -- 如果移动窗口也报错，可能也需要加 monitor
    hl.bind(mod .. "+SHIFT+" .. s, hl.dsp.window.move({ workspace = s }))
    end

    -- === 硬件控制 ===
    hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("dms ipc call audio increment 3"))
    hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("dms ipc call audio decrement 3"))
    hl.bind("XF86AudioMute", hl.dsp.exec_cmd("dms ipc call audio mute"))
    hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("dms ipc call brightness increment 5"))
    hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("dms ipc call brightness decrement 5"))
