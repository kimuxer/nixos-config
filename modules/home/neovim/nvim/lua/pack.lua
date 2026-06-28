-- lua/pack.lua
local plugins = {
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/rcarriga/nvim-notify",
	"https://github.com/nvim-mini/mini.icons",
	"https://github.com/nvim-tree/nvim-web-devicons",
	"https://github.com/folke/which-key.nvim",
	"https://github.com/nvim-mini/mini.files",
	"https://github.com/nvim-telescope/telescope.nvim",
	"https://github.com/nvim-telescope/telescope-fzf-native.nvim",
	"https://github.com/stevearc/conform.nvim",
	"https://github.com/NeogitOrg/neogit",
	"https://github.com/folke/tokyonight.nvim",
	"https://github.com/folke/lazydev.nvim",
	"https://github.com/rachartier/tiny-inline-diagnostic.nvim",
}

vim.pack.add(plugins)

local wanted = {}
for _, src in ipairs(plugins) do
	local spec = type(src) == "string" and { src = src } or src
	local name = spec.name or spec.src:match("/([^/]+)$")
	wanted[name] = true
end

local orphans = {}
for _, info in ipairs(vim.pack.get()) do
	if not wanted[info.spec.name] then
		orphans[#orphans + 1] = info.spec.name
	end
end

if #orphans > 0 then
	vim.notify("vim.pack: removing orphans: " .. table.concat(orphans, ", "), vim.log.levels.INFO)
	vim.pack.del(orphans, { force = true })
end
