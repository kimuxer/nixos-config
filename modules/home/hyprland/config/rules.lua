-- /home/kim/.config/hypr/rules.lua

-- =============================================================================
-- 1. 全局透明度控制
-- =============================================================================
-- 默认所有窗口非活动透明度为 0.9，Kitty 和 Zen 除外（保持 1.0）
hl.window_rule({ match = { class = ".*" }, opacity = "1.0 override 0.9 override" })
hl.window_rule({ match = { class = "^(kitty|zen)$" }, opacity = "1.0 1.0" })

-- =============================================================================
-- 2. 边框与阴影规则 (差异化)
-- =============================================================================

-- ⚡ Zen 浏览器：保留边框，但移除阴影 (极简办公风)
hl.window_rule({ match = { class = "^(zen)$" }, border_size = 1, no_shadow = true })

-- ⚡ Kitty 终端：保留边框，保留透明度，移除阴影 (极客风)
hl.window_rule({ match = { class = "^(kitty)$" }, border_size = 1, no_shadow = true })

-- =============================================================================
-- 3. Quickshell / DMS 组件 (强制去边框，因为这是组件级 UI)
-- =============================================================================
hl.window_rule({ 
    match = { class = "org\\.quickshell\\.quickshell" }, 
    float = true, border_size = 0, no_shadow = true, no_anim = true, no_initial_focus = true, pin = true 
})

-- =============================================================================
-- 4. 系统功能类规则 (无需改动)
-- =============================================================================
-- 弹出对话框
hl.window_rule({ match = { title = "^(Open File|Save File|Select Folder)$" }, float = true, center = true })

-- 浏览器画中画
hl.window_rule({ match = { title = "^(Picture-in-Picture)$" }, float = true, pin = true })

-- XWayland 兼容性
hl.window_rule({ match = { xwayland = true }, rounding = 0 })
