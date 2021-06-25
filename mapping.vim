map ' `
nnoremap <silent><esc> :nohlsearch<cr>

"Completion menu
"inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
"inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<tab>"
"inoremap <silent><expr><Enter> pumvisible() ? coc#_select_confirm() : "\<Enter>"
"inoremap <silent><expr><c-space> coc#refresh()
"let g:coc_snippet_next = '<Enter>'

augroup mapInCmdWin
    autocmd!
    autocmd CmdwinEnter * :noremap <buffer><Esc> :q<cr>
augroup END

augroup cpp
    autocmd!
    autocmd BufEnter *.cpp  nnoremap <buffer>gc :e %:r.hpp<cr>
    autocmd BufEnter *.hpp  nnoremap <buffer>gc :e %:r.cpp<cr>
augroup END

"Alt j/k/h/l/h to navigate in the comand mode
cnoremap <A-k> <up>
cnoremap <A-j> <down>
cnoremap <A-h> <left>
cnoremap <A-l> <right>

"Alt j/k/h/l/h to navigate in the insert mode
inoremap <A-k> <up>
inoremap <A-j> <down>
inoremap <A-h> <left>
inoremap <A-l> <right>

"Move the line in visual mode up and down
xnoremap K :move'<-2<cr>gv
xnoremap J :move'>+1<cr>gv

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
nnoremap <leader>oa  <cmd>lua require("customtelescope").search_ignore()<cr>
nnoremap <leader>oA  <cmd>lua require("customtelescope").search_specific()<cr>
nnoremap <leader>ot :tabnew<cr>
nnoremap <leader>ob :Telescope buffers<cr>
nnoremap <leader>ot :tabs<cr>
nnoremap <leader>oR :register<cr>
nnoremap <leader>or :Telescope oldfiles<cr>
nnoremap <leader>om :Neomake!
nnoremap <leader>oM :make!
nnoremap <leader>os :NeoSnippetEdit -vertical<cr>
nnoremap <leader>oS <cmd>lua require("telescope.builtin").find_files({cwd = '~/.config/nvim/neosnippets'})<cr>
nnoremap <leader>of <cmd>lua require("customtelescope").search_file_ignore()<cr>
nnoremap <leader>oF :Telescope file_browser<cr>
nnoremap <leader>oo z=
nnoremap <leader>oh :Telescope help_tags<cr>

"Edit configuration - leader + o + c
nnoremap <leader>oci :e ~/.config/nvim/init.vim<cr>
nnoremap <leader>ocp :e ~/.config/nvim/pluggin.vim<cr>
nnoremap <leader>ocm :e ~/.config/nvim/mapping.vim<cr>
nnoremap <leader>ocl :e ~/.config/nvim/localMapping.vim<cr>
nnoremap <leader>occ :e ~/.config/nvim/createFile.vim<cr>
nnoremap <leader>oca :e ~/.config/nvim/abreviation.vim<cr>
nnoremap <leader>ocA <cmd>lua require("telescope.builtin").find_files({cwd = '~/.config/nvim'})<cr>

"Git - leader + g
nnoremap <leader>gd :Gvdiffsplit!<cr><c-w><c-r>
nnoremap <leader>gD :Gdiffsplit!<cr><c-w><c-r>
nnoremap <leader>gl :Glog<cr>
nnoremap <leader>gb :Git blame<cr>
nnoremap <leader>ga :Git! difftool<cr>:call QuickFixGitMapping()<cr>
nnoremap <leader>gA :Git difftool -y<cr>

"Toggle - leader + t
nnoremap <leader>tw :set wrap!<cr>
nnoremap <leader>tf :call ToggleMappingQuickFix()<cr>
nnoremap <leader>tn :set relativenumber!<cr>
nnoremap <leader>tc :setlocal spell!<cr>
nnoremap <leader>th :set hidden!<cr>
nnoremap <leader>ts :call ToggleSyntax()<cr>
nnoremap <leader>td :call deoplete#toggle()<cr>

"Quick fix - leader + f
nnoremap <leader>fq :call QuickFixDefaultMapping()<cr>
function! QuickFixGitMapping()
        nnoremap <leader>fo :copen 20<cr>
        nnoremap <leader>fc :cclose<cr>
        nnoremap <leader>fn :cnext<cr><c-w>o:Gvdiffsplit!<cr><c-w><c-r>zz
        nnoremap <leader>fp :cprevious<cr><c-w>o:Gvdiffsplit!<cr><c-w><c-r>zz
        nnoremap <leader>ff :cfirst<cr><c-w>o:Gvdiffsplit!<cr><c-w><c-r>zz
        nnoremap <leader>fe :clast<cr><c-w>o:Gvdiffsplit!<cr><c-w><c-r>zz
endfunction

let g:aa=1
function! ToggleMappingQuickFix()
    call QuickFixDefaultMapping()
    let g:aa = !g:aa
endfunction

function! QuickFixDefaultMapping()
    if g:aa
        nnoremap <leader>fo :copen 20<cr>
        nnoremap <leader>fc :cclose<cr>
        nnoremap <leader>fn :cnext<cr>
        nnoremap <leader>fp :cprevious<cr>
        nnoremap <leader>ff :cfirst<cr>
        nnoremap <leader>fe :clast<cr>
    else
        "List - leader + f
        nnoremap <leader>fo :lopen 20<cr>
        nnoremap <leader>fc :lclose<cr>
        nnoremap <leader>fn :lnext<cr>
        nnoremap <leader>fp :lprevious<cr>
        nnoremap <leader>ff :lfirst<cr>
        nnoremap <leader>fe :llast<cr>
    endif
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
