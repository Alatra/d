require('nvim-treesitter.configs').setup {
    ensure_installed = {"cpp","lua","python","haskell","html","css"},
    highlight = {
        enable = true
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "gs",
            node_incremental = "gm",
            scope_incremental = "gS",
            node_decremental = "gl",
        },
    },
    indent = {
        enable = true
    }
}
