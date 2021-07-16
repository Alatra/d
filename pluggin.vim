call plug#begin("~/.config/nvim/bundle")

" Line
Plug 'hoob3rt/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'

"Theme 
Plug 'folke/tokyonight.nvim'

"IndentLine
Plug 'Yggdroot/indentLine'
let g:indentLine_char = '┆'

"Git fugitive
Plug 'tpope/vim-fugitive'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
"Plug 'nvim-treesitter/nvim-treesitter-textobjects' 

"Make asynchronously make
Plug 'neomake/neomake'

let g:neomake_open_list = 2 " auto open quickfix when job done
let g:neomake_list_height = 20 " set the size of quicfix after job done
highlight NeomakeErrorMsg ctermfg=227 ctermbg=237 "change color or errom msg

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'


Plug 'Shougo/neosnippet.vim'

let g:neosnippet#snippets_directory = "~/.config/nvim/neosnippets"
let g:neosnippet#enable_completed_snippet=1

imap ù <Plug>(neosnippet_expand_or_jump)
smap ù <Plug>(neosnippet_expand_or_jump)
xmap ù <Plug>(neosnippet_expand_target)

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

"Coc
"Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()
