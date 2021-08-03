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

require('nvim-treesitter.configs').setup {
  textobjects = {
    select = {
      enable = true,
      lookahead = true,

      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
        ["al"] = "@loop.outer",
        ["il"] = "@loop.inner",

        ["ai"] = "@conditional.outer",
        ["ii"] = "@conditional.inner",

        ["aa"] = "@parameter.outer",
        ["ia"] = "@parameter.inner",

        -- Python block not use { but considered the same
        ["aB"] = { python = "@block.outer", },
        ["iB"] = { python = "@block.inner", },
      },
    },
  },
}
