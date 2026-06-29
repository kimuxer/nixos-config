-- lua/pack.lua

local plugins = {
    { src = "https://github.com/rcarriga/nvim-notify" },
    { src = "https://github.com/nvim-mini/mini.statusline" },
    { src = "https://github.com/nvim-mini/mini.files" },
    { src = "https://github.com/nvim-mini/mini.icons" },
    { src = "https://github.com/nvim-mini/mini.indentscope" },
    { src = "https://github.com/nvim-mini/mini.pairs" },
    { src = "https://github.com/nvim-tree/nvim-web-devicons" },
    { src = "https://github.com/folke/which-key.nvim" },
    { src = "https://github.com/nvim-telescope/telescope.nvim" },
    { src = "https://github.com/nvim-lua/plenary.nvim" },
    {
        src = "https://github.com/nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        name = "telescope-fzf-native.nvim",
    },
    { src = "https://github.com/stevearc/conform.nvim" },
    { src = "https://github.com/NeogitOrg/neogit" },
    { src = "https://github.com/folke/tokyonight.nvim" },
    { src = "https://github.com/folke/lazydev.nvim" },
    { src = "https://github.com/rachartier/tiny-inline-diagnostic.nvim" },
    { src = "https://github.com/NotAShelf/direnv.nvim" },
}

-- PackChanged 钩子处理编译步骤，必须在 add() 之前注册
vim.api.nvim_create_autocmd("PackChanged", {
    group = vim.api.nvim_create_augroup("VimPackHooks", { clear = true }),
    callback = function(ev)
        local name, kind = ev.data.spec.name, ev.data.kind

        -- 查找插件配置中是否有 build 定义
        local plugin_spec = nil
        for _, p in ipairs(plugins) do
            if ev.data.spec.name == p.name then
                plugin_spec = p
                break
            end
        end

        if plugin_spec and plugin_spec.build and (kind == "install" or kind == "update") then
            vim.notify(string.format("vim.pack: building %s...", name), vim.log.levels.INFO)

            if type(plugin_spec.build) == "string" then
                local cmd = vim.split(plugin_spec.build, ' ', { trimempty = true })
                vim.system(cmd, { cwd = ev.data.path }, function(obj)
                    vim.schedule(function()
                        if obj.code == 0 then
                            vim.notify(string.format("Build completed for %s!", name), vim.log.levels.INFO)
                        else
                            vim.notify(string.format("Build failed for %s:\n%s", name, obj.stderr), vim.log.levels.ERROR)
                        end
                    end)
                end)
            elseif type(plugin_spec.build) == "function" then
                plugin_spec.build(ev.data.path)
            end
        end
    end,
})

vim.pack.add(plugins)

vim.api.nvim_create_user_command("PackCleanAll", function()
    vim.cmd("packdel ++all")
    vim.notify("vim.pack: cleaned all inactive plugins", vim.log.levels.INFO)
end, { desc = "Clean up all inactive plugins" })
