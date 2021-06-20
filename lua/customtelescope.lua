local actions = require('telescope.actions')

require('telescope').load_extension('fzf')

function twoDotsfunction (...)
    actions.close(...)
    vim.cmd(vim.fn.input(":","","command"))
end

require('telescope').setup{
    defaults={
        mappings={
            i={
                ["<c-f>"] = actions.send_to_qflist + actions.open_qflist,
                ["<c-j>"] = actions.move_selection_next,
                ["<c-k>"] = actions.move_selection_previous
            },
            n = {
                [":"] = twoDotsfunction
            }
        }
    }
}

local mappings = {}

mappings.file_dotfiles = function()
    require("telescope.builtin").find_files({
        cwd = "~/.config/nvim"
    })
end

function grepString(glob)
    require("telescope.builtin").grep_string({
        vimgrep_arguments = {
            'rg',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case',
            '--trim',
            '--glob=' .. glob
        },
        search = vim.fn.input("Patern: ")
    })
end

mappings.search_ignore = function()
    grepString('!{' .. vim.api.nvim_get_option('wildignore') .. '}')
end


local typeSearch = "*"

mappings.search_specific = function()
    local userType = vim.fn.input("Type: ")

    if(userType == "cpp") then
        typeSearch = "*.hpp,*.cpp"
    elseif(userType == "py" or userType == "lua" or userType == "vim") then
        typeSearch = "*." .. userType
    elseif(userType ~= "") then
        typeSearch = userType
    end
    grepString('{' .. typeSearch .. '}')
end

mappings.search_file_ignore = function()
    require("telescope.builtin").find_files({
        find_command = {
            'rg',
            '--files',
            '--ignore',
            '--hidden',
            '--glob=!{' .. vim.api.nvim_get_option('wildignore') .. '}'
        }
    })
end

return mappings
