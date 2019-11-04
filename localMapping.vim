let maplocalleader = "\-"
augroup local_map
    autocmd!
    autocmd FileType lua  nnoremap <buffer><localleader>c :normal 0i--<esc><cr>
    autocmd FileType java,cpp  nnoremap <buffer><localleader>c :normal 0i//<esc><cr>
    autocmd FileType python  nnoremap <buffer><localleader>c :normal 0i#<esc><cr>
    autocmd FileType vim  nnoremap <buffer><localleader>c :normal 0i"<esc><cr>
    autocmd FileType lua  nnoremap <buffer><localleader>C :normal 0f-xx<esc><cr>
    autocmd FileType java,cpp  nnoremap <buffer><localleader>C :normal 0f/Xx<esc><cr>
    autocmd FileType python  nnoremap <buffer><localleader>C :normal 0f#X<esc><cr>
    autocmd FileType vim  nnoremap <buffer><localleader>C :normal 0x<esc><cr>
    autocmd FileType tex  nnoremap <buffer><localleader>p :call Textopdf()<cr>
augroup END
