-- modules/home/neovim/nvim/after/lsp/nixd.lua
return {
    cmd = { "nixd" },
    filetypes = { "nix" },
    root_markers = { "flake.nix", ".git" },
    settings = {
        nixd = {
            nixpkgs = {
                expr = 'builtins.getFlake "' .. (vim.env.PRJ_ROOT or ".") .. '"',
            },
            formatting = {
                command = { "nixfmt" },
            },
        },
    },
}
