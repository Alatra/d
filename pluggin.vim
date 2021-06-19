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

"Denite plugin
Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }

"Denite Setting
autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
    nnoremap <silent><buffer><expr> <CR>     denite#do_map('do_action')
    nnoremap <silent><buffer><expr> o        denite#do_map('do_action')
    nnoremap <silent><buffer><expr> s        denite#do_map('do_action', 'split')
    nnoremap <silent><buffer><expr> v        denite#do_map('do_action', 'vsplit')
    nnoremap <silent><buffer><expr> t        denite#do_map('do_action', 'tabopen')
    nnoremap <silent><buffer><expr> d        denite#do_map('do_action', 'delete')
    nnoremap <silent><buffer><expr> p        denite#do_map('do_action', 'preview')
    nnoremap <silent><buffer><expr> q        denite#do_map('quit')
    nnoremap <silent><buffer><expr> <esc>    denite#do_map('quit')
    nnoremap <silent><buffer><expr> i        denite#do_map('open_filter_buffer')
    nnoremap <silent><buffer><expr> m        denite#do_map('toggle_select').'j'
    nnoremap <silent><buffer> a              :call denite#call_map('toggle_select_all')<CR>
    nnoremap <silent><buffer> f              :call denite#call_map('do_action', 'quickfix')<CR>
    nnoremap <silent><buffer> F              :call denite#call_map('toggle_select_all')<CR>:call denite#call_map('do_action', 'quickfix')<CR>
    nnoremap <silent><buffer> <C-j>           j
    nnoremap <silent><buffer> <C-k>           k
    nnoremap <silent><buffer> :              :call denite#call_map('quit')<cr>q:i
endfunction

function! s:test()
    call denite#call_map('quit')
    execute "normal q:"
    echom "Not working"
endfunction

autocmd FileType denite-filter call s:denite_filter_my_settings()
function! s:denite_filter_my_settings() abort
    inoremap <silent><buffer><expr> <CR> denite#do_map('do_action')
    inoremap <silent><buffer> <esc> <c-c><c-w>k
    inoremap <silent><buffer> <C-j> <Esc>
                \:call denite#move_to_parent()<CR>
                \:call cursor(line('.')+1,0)<CR>
                \:call denite#move_to_filter()<CR>A
    inoremap <silent><buffer> <C-k> <Esc>
                \:call denite#move_to_parent()<CR>
                \:call cursor(line('.')-1,0)<CR>
                \:call denite#move_to_filter()<CR>A
    inoremap <silent><buffer> <tab> <Esc>
                \:call denite#move_to_parent()<CR>
                \"wyy
                \:call denite#move_to_filter()<CR>
                \"_dd"wp0xA
    inoremap <silent><buffer> <c-c> <c-c><c-w>k
    inoremap <silent><buffer> : <esc>:call denite#call_map('quit')<cr>q:i
endfunction

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

"Coc
"Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()
