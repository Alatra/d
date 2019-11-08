map ' `
nnoremap <silent>ù :nohlsearch<Bar>:echo<CR> 

"Completion menu
inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<tab>"
inoremap <silent><expr><Enter> pumvisible() ? coc#_select_confirm() : "\<Enter>"
inoremap <silent><expr><c-space> coc#refresh()
let g:coc_snippet_next = '<Enter>'

"Get path in command mode
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

augroup mapInCmdWinFZF
    autocmd!
    autocmd CmdwinEnter * :noremap <buffer><Esc> :q<cr>
augroup END

"Leader
nnoremap <SPACE> <Nop>
let mapleader = "\<Space>"

map <leader>w <c-W>
nnoremap <leader>ev :e $MYVIMRC<cr>
nnoremap <leader>s :w<cr>
augroup saveInTempBash
    autocmd!
    autocmd BufEnter /tmp/* :nnoremap <buffer><leader>s :wq<cr>
augroup END

"Interact with general clipboard
nnoremap <leader>y "+y
nnoremap <leader>Y "+Y
nnoremap <leader>p "+p
nnoremap <leader>P "+P

"Open map
let g:ctrlp_map = '<leader>t'
nnoremap <leader>ot :tabnew<cr>
nnoremap <leader>oT :tabnew \| terminal<cr>
nnoremap <leader>of :copen<cr>
nnoremap <silent><leader>oc :setlocal spell spelllang=en_uk<cr>
nnoremap <silent><leader>on :NERDTreeToggle<cr>
nnoremap <silent><leader>od <Plug>(coc-diagnostic-info)<cr>

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
    if &filetype == 'vim'
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction

"Close map
nnoremap <leader>ct :tabclose<cr>
nnoremap <leader>cf :cclose<cr>
nnoremap <silent><leader>cc :setlocal nospell<cr>
nnoremap <silent><leader>cn :NERDTreeToggle<cr>

"Quick fix map
nnoremap <leader>fn :cnext<cr>
nnoremap <leader>fp :cprevious<cr>

"Surround
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel

"Replace 
nnoremap <leader>[ :%s/<c-r><c-w>//g<left><left>

"Format
function! FormatAll()
    let foldMark = line("`a")
    :keepjumps normal magg=G'azz
    :execute foldMark."ka"
endfunction

nnoremap <silent><leader><tab> :call FormatAll()<cr>

augroup formatHaskeel
    autocmd!
    autocmd BufEnter *.hs nnoremap <buffer><silent><leader><tab> <Plug>(coc-format)<cr>
augroup END

"Terminal map
tnoremap <Esc> <C-\><C-n>
tnoremap <C-V><Esc> <Esc>
augroup mapInTerminal
    autocmd!
    autocmd TermOpen * noremap <buffer><Enter> i<enter>
    autocmd TermOpen * setlocal nonumber
augroup END
