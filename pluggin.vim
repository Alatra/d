call plug#begin("~/.config/nvim/bundle")


"Airline
Plug 'vim-airline/vim-airline',
Plug 'vim-airline/vim-airline-themes',

"Airline Settings
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''

"Theme 
""palenight
Plug 'drewtempelmeyer/palenight.vim'
"gruvbox
Plug 'morhetz/gruvbox'
"purity
Plug 'kyoz/purify', { 'rtp': 'vim' }


"IndentLine
Plug 'Yggdroot/indentLine'

"IndentLine setting
let g:indentLine_char = '┆'

"Git fugitive
Plug 'tpope/vim-fugitive'

"vim-polyglot - syntax highlight
Plug 'sheerun/vim-polyglot'
"jsx-pretty setting
highlight def link jsxPunct Identifier
highlight def link jsxCloseString Identifier

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

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

"Coc
"Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()
