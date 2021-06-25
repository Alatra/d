let maplocalleader = "\-"
augroup local_map
    autocmd!
    "Comment
    autocmd FileType lua  xnoremap <buffer><leader>c :normal I--<cr>
    autocmd FileType java,cpp  xnoremap <buffer><leader>c :normal I//<cr>
    autocmd FileType python  xnoremap <buffer><leader>c :normal I#<cr>
    autocmd FileType vim  xnoremap <buffer><leader>c :normal I"<cr>
    "Uncomment
    autocmd FileType lua  xnoremap <buffer><leader>C :normal ^d2l<cr>
    autocmd FileType java,cpp  xnoremap <buffer><leader>C :normal ^d2l<cr>
    autocmd FileType python  xnoremap <buffer><leader>C :normal ^x<cr>
    autocmd FileType vim  xnoremap <buffer><leader>C :normal ^x<cr>
    "Tex to pdf
    autocmd FileType tex  nnoremap <buffer><localleader>p :call Textopdf()<cr>
augroup END

command! -nargs=* Fig :call CreatFigureTex(<q-args>)
command! -nargs=* Mcpp :call CreateCPPMakefile(<q-args>)
command! Algo :call CreateAlgo()


"Text local mapping
function! Textopdf()

    let fname = expand("%:t:r")
    :execute "w"
    :execute "!pdflatex " . fname . ".tex"
    :execute "!bibtex " . fname 
    :execute "!pdflatex " . fname . ".tex"
    :execute "!pdflatex " . fname . ".tex"
    :execute "!evince " . fname . ".pdf &"
endfunction

function! CreatFigureTex(name)
    :execute "normal o\\begin{figure}[h]"
    :execute "normal o\\centering"
    :execute "normal o\\includegraphics[width=1\\textwidth]{" . a:name . ".png}"
    :execute "normal o\\label{fig:" . a:name . "}"
    :execute "normal o\\end{figure}"
    :execute "normal kko\\caption{}"
    :startinsert
endfunction

function! CreateAlgo()
    :execute "normal o\\begin{algorithm}[H]"
    :execute "normal o\\SetAlgoLined"
    :execute "normal o\\KwData{}"
    :execute "normal o\\KwResult{}"
    :execute "normal o\\caption{}"
    :execute "normal o\\end{algorithm}"
    :execute "normal kO"
    :startinsert
endfunction

function! CreateCPPMakefile(name)
    :execute "normal o" . a:name . ".o: " . a:name . ".cpp " . a:name . ".hpp"
    :execute "normal o$(CC) $(ALL_FLAGS) -c $< -o $@"
endfunction
