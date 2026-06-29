-- 4. Telescope
require("telescope").setup({
    defaults = {
        path_display = { "truncate" },
        file_ignore_patterns = { "^.git/" },
    },
})
pcall(require("telescope").load_extension, "fzf")
