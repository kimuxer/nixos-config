-- 6. Lazydev
local status, lazydev = pcall(require, "lazydev")
if status then
	lazydev.setup({
		library = {
			{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
		},
		integrations = {
			lspconfig = false,
		},
	})
end
