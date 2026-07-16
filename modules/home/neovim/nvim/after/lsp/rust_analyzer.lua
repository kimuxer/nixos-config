-- modules/home/neovim/nvim/after/lsp/rust_analyzer.lua
return {
    cmd = { "rust-analyzer" },
    filetypes = { "rust" },
    root_markers = { "Cargo.toml", ".git" },
    settings = {
        ["rust-analyzer"] = {
            cargo = { allFeatures = false },
            checkOnSave = { command = "clippy" },
        },
    },
}
