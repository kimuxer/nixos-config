-- init.lua
require("pack")

local function load_dir(dir, prefix)
    local files = vim.fn.glob(vim.fn.stdpath("config") .. "/lua/" .. dir .. "/*.lua", true, true)
    for _, file in ipairs(files) do
        require(prefix .. vim.fn.fnamemodify(file, ":t:r"))
    end
end

load_dir("config", "config.")
load_dir("plugins", "plugins.")
