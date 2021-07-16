require('lualine').setup{
    options = {
        theme = 'tokyonight',
        section_separators = {'', ''},
        component_separators = {'', ''},
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch','diff'},
        lualine_c = {
            {
                'filename',
                file_status = true,
                path = 0
            },
            {
                'diagnostics',
                sources = {'nvim_lsp'},
            }
        },
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    extensions = {'quickfix'}
}

vim.g.tokyonight_style = "dark"
vim.cmd[[colorscheme tokyonight]]

require("configtelescope")
require("configtreesitter")
require("configlsp")
