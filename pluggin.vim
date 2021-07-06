call plug#begin("~/.config/nvim/bundle")

" Line
Plug 'hoob3rt/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'

"Theme 
""palenight
Plug 'drewtempelmeyer/palenight.vim'
"gruvbox
Plug 'morhetz/gruvbox'
"purity
Plug 'kyoz/purify', { 'rtp': 'vim' }
"tokyodark
Plug 'tiagovla/tokyodark.nvim'

"IndentLine
Plug 'lukas-reineke/indent-blankline.nvim'
let g:indent_blankline_char = '┆'
let g:indent_blankline_space_char = '-'
let g:indent_blankline_show_first_indent_level = v:false
let g:indent_blankline_filetype_exclude = ['help']

"Git fugitive
Plug 'tpope/vim-fugitive'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
"Plug 'nvim-treesitter/nvim-treesitter-textobjects' 

"Make asynchronously make
Plug 'neomake/neomake'

let g:neomake_open_list = 2 " auto open quickfix when job done
let g:neomake_list_height = 20 " set the size of quicfix after job done
highlight NeomakeErrorMsg ctermfg=227 ctermbg=237 "change color or errom msg

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'deoplete-plugins/deoplete-jedi'

"TODO remove ?
let g:deoplete#enable_at_startup = 1
inoremap <silent><expr><c-space> deoplete#manual_complete()

inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

inoremap <expr><BS> deoplete#smart_close_popup()."\<C-h>"

function! s:check_back_space() abort "{{{
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}


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
