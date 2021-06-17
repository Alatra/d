call plug#begin("~/.config/nvim/bundle")


"Airline
Plug 'vim-airline/vim-airline',
Plug 'vim-airline/vim-airline-themes',

"Airline Settings
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''

"Theme palenight
Plug 'drewtempelmeyer/palenight.vim'

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

"Make asyncrone
Plug 'neomake/neomake'

let g:neomake_open_list = 2 " auto open quickfix when job done
let g:neomake_list_height = 20 " set the size of quicfix afeter job done
highlight NeomakeErrorMsg ctermfg=227 ctermbg=237 "change color or errom msg

"Denite plugin
Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }

"Denite Setting
autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
    nnoremap <silent><buffer><expr> <CR>     denite#do_map('do_action')
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
    noremap <silent><buffer> <C-j>           j
    noremap <silent><buffer> <C-k>           k
endfunction

autocmd FileType denite-filter call s:denite_filter_my_settings()
function! s:denite_filter_my_settings() abort
    inoremap <silent><buffer><expr> <CR> denite#do_map('do_action')
    "must be imap because use <Plug>
    inoremap <silent><buffer> <esc> <esc><c-w>k
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
endfunction


"Coc
"Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()
