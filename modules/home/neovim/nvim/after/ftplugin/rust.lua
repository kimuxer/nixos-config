-- after/ftplugin/rust.lua
-- 格式化交给 conform，这行放这里是为了跟 06-formatting.lua 分开维护 rust 专属规则
require("conform").formatters_by_ft.rust = { "rustfmt" }
