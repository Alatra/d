map ' `
nnoremap <silent><esc> :nohlsearch<cr>

"Completion menu
"inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
"inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<tab>"
"inoremap <silent><expr><Enter> pumvisible() ? coc#_select_confirm() : "\<Enter>"
"inoremap <silent><expr><c-space> coc#refresh()
"let g:coc_snippet_next = '<Enter>'

"augroup mapInCmdWinFZF
"    autocmd!
"    autocmd CmdwinEnter * :noremap <buffer><Esc> :q<cr>
"augroup END
"Alt j/k to navigate in the history in comand mode

cnoremap <A-k> <up>
cnoremap <A-j> <down>
cnoremap <A-h> <left>
cnoremap <A-l> <right>

"Alt j/k/h/l/h to navigate in the insert mode
inoremap <A-k> <up>
inoremap <A-j> <down>
inoremap <A-h> <left>
inoremap <A-l> <right>

"Leader
nnoremap <SPACE> <Nop>
let mapleader = "\<Space>"

"Direct
"Save leader + s
nnoremap <leader>s :w<cr>
"Surround leader + "/ leader + '
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel
"Replace  leader + r
nnoremap <leader>[ :%s/<c-r><c-w>//g<left><left>

"Open - leader + o
nnoremap <leader>oa :call SetDeniteGrep(0) <cr>:Denite grep<cr> 
nnoremap <leader>oA :call SetDeniteGrep(1) <cr>:Denite grep<cr> 
nnoremap <leader>ot :tabnew<cr>
nnoremap <leader>ob :Denite buffer<cr>
nnoremap <leader>ot :tabs<cr>
nnoremap <leader>or :register<cr>
nnoremap <leader>om :Neomake!
nnoremap <leader>oM :make!
nnoremap <leader>os :NeomakeSh! 
nnoremap <leader>of :Denite file/rec -start-filter<cr>
nnoremap <leader>oF :Denite file -start-filter<cr>

"Edit configuration - leader + o + c
nnoremap <leader>oci :tab vs ~/.config/nvim/init.vim<cr>
nnoremap <leader>ocp :tab vs ~/.config/nvim/pluggin.vim<cr>
nnoremap <leader>ocm :tab vs ~/.config/nvim/mapping.vim<cr>
nnoremap <leader>ocl :tab vs ~/.config/nvim/localMapping.vim<cr>
nnoremap <leader>oca :tab vs ~/.config/nvim/abreviation.vim<cr>
nnoremap <leader>occ :tab vs ~/.config/nvim/createFile.vim<cr>
nnoremap <leader>ocr :tab vs ~/.config/nvim/ripgreprc<cr>

"Toggle - leader + t
nnoremap <leader>tw :set wrap!<cr>
nnoremap <leader>tf :call ToggleMappingQuickFix()<cr>
nnoremap <leader>tn :set relativenumber!<cr>
nnoremap <leader>tc :setlocal spell!<cr>
nnoremap <leader>th :set hidden!<cr>
nnoremap <leader>ts :call ToggleSyntax()<cr>

let g:aa=1
function! ToggleMappingQuickFix()
    if g:aa
        "Quick fix - leader + f
        nnoremap <leader>fo :copen 20<cr>
        nnoremap <leader>fc :cclose<cr>
        nnoremap <leader>fn :cnext<cr>
        nnoremap <leader>fp :cprevious<cr>
    else
        "List - leader + f
        nnoremap <leader>fo :lopen 20<cr>
        nnoremap <leader>fc :lclose<cr>
        nnoremap <leader>fn :lnext<cr>
        nnoremap <leader>fp :lprevious<cr>
    endif
    let g:aa = !g:aa
endfunction
call ToggleMappingQuickFix()

function! ToggleSyntax()
    if exists("g:syntax_on") 
        syntax off 
    else 
        syntax enable 
    endif
endfunction

"Tab management - leader + Tab
nnoremap <leader><tab>n :tabnew<cr>
nnoremap <leader><tab>c :tabclose<cr>
nnoremap <leader><tab>o :tabonly<cr>
nnoremap <leader><tab>] :tabnext<cr>
nnoremap <leader><tab>[ :tabprev<cr>
nnoremap <leader><tab>1 :tabnext 1<cr>
nnoremap <leader><tab>2 :tabnext 2<cr>
nnoremap <leader><tab>3 :tabnext 3<cr>
nnoremap <leader><tab>4 :tabnext 4<cr>
nnoremap <leader><tab>5 :tabnext 5<cr>

"Buffer - leader + b
nnoremap <leader>bc <c-w>c
nnoremap <leader>bC :bdelete<cr>
nnoremap <leader>bn :bnew<cr>

augroup cpp
    autocmd!
    autocmd BufEnter *.cpp  nnoremap <buffer>gc :e %:r.hpp<cr>
    autocmd BufEnter *.hpp  nnoremap <buffer>gc :e %:r.cpp<cr>
augroup END
