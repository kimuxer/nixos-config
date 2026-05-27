-- 官方正确语法：hl.curve(名字, 表)
hl.curve("easeOutQuint", { type = "bezier", points = { {0.23, 1} , {0.32, 1} } })
hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0.05} , {0.36, 1} } })
hl.curve("smoothOut", { type = "bezier", points = { {0.36, 0} , {0.66, -0.56} } })
hl.curve("overshot", { type = "bezier", points = { {0.05, 0.9} , {0.1, 1.05} } })

hl.animation({ leaf = "windows", enabled = true, speed = 7, bezier = "easeOutQuint", style = "popin 80%" })
hl.animation({ leaf = "fade", enabled = true, speed = 10, bezier = "easeOutQuint" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 6, bezier = "easeOutQuint", style = "slidefade 20%" })
hl.animation({ leaf = "border", enabled = true, speed = 10, bezier = "easeInOutCubic" })

-- 重点：把这个 hl.config 删掉！！！就是它导致报错：attempt to index a function value
-- 只保留上面的曲线 + 动画，不要写任何 hl.config 在这里

