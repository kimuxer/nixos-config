-- lua/pack.lua
local pack_path = vim.fn.stdpath("config") .. "/pack/plugins/start"

vim.pack = {}

vim.pack.add = function(plugins)
    vim.fn.mkdir(pack_path, "p")
    for _, plug in ipairs(plugins) do
        -- 从 URL 中提取插件名
        local name = plug:match("/([^/]+)%.git$") or plug:match("/([^/]+)$")
        local dest = pack_path .. "/" .. name

        -- 如果目录不存在，自动克隆
        if vim.fn.isdirectory(dest) == 0 then
            print("Installing plugin: " .. name)
            vim.fn.system({ "git", "clone", "--depth", "1", "https://github.com/" .. plug, dest })
        end
    end
end
