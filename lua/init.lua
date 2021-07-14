require('lualine').setup{
    options = {
        theme = 'onedark',
        section_separators = {'', ''}
    },
    extensions = {'quickfix'}
}

require("configtelescope")
require("configtreesitter")
require("configlsp")
