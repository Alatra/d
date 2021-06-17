"Bash file
augroup filetype_bash
    autocmd!
    autocmd BufNewFile *.sh :execute ":normal i#!/bin/bash\<esc>o"
augroup END

"Java
augroup java_creation
    autocmd!
    autocmd BufNewFile *.java :call CreateJavaClass()
augroup END

function! CreateJavaClass()
    let fclassName = expand("%:t")
    let fclassName = substitute(fclassName, "\\.java", "", "g")
    :execute "normal ipublic class ".fclassName."{"
    :execute "normal o}"
    :execute "normal ggO"
    :execute "normal o"
    :execute "normal ggipackage "
endfunction

"React
augroup react_creation
    autocmd!
    autocmd BufNewFile *.jsx :call CreateReactClass()
augroup END

function! CreateReactClass()
    let fclassName = expand("%:t")
    let fclassName = substitute(fclassName, "\\.jsx", "", "g")
    :execute "normal iimport React from 'react';"
    :execute "normal oimport PropTypes from 'prop-types';"
    :execute "normal o"
    :execute "normal oexport default class ".fclassName." extends React.Component {"
    :execute "normal o"
    :execute "normal oconstructor(props){"
    :execute "normal osuper(props)"
    :execute "normal o}"
    :execute "normal o"
    :execute "normal orender(){"
    :execute "normal oreturn("
    :execute "normal oediv"
    :execute "normal o);"
    :execute "normal o}"
    :execute "normal o"
    :execute "normal o}"
    :execute "normal gg"
endfunction

"Cpp
augroup cpp_creation
    autocmd!
    autocmd BufNewFile *.cpp :call AddHppInclude()
augroup END

function! AddHppInclude()
    let finclude = expand("%:t")
    let finclude = substitute(finclude, "\\.c", "\\.h", "g")
    if(finclude != "main.hpp")
        :execute "normal i#include \"".finclude."\""
        :execute "normal o"
    endif
endfunction

"Hpp
augroup hpp_creation
    autocmd!
    autocmd BufNewFile *.hpp call HppInsertion()
augroup END

function! HppInsertion()
    let fname = expand("%:t")
    let fclassname = substitute(fname,"\\.hpp","","g")
    let fname = toupper(fname)
    let fname = substitute(fname, "\\.", "_", "g")
    :execute "normal a#ifndef _".fname
    :execute "normal o#define _".fname
    :execute "normal 2o"
    :execute "normal o#endif /* _".fname."*/"
    :execute "normal 3G"
    :execute "normal oclass ".fclassname."{"
    :execute "normal o};"
    :execute "normal k"
endfunction

"Haskell
augroup haskell_creation
    autocmd!
    autocmd BufNewFile *.hs call CreateHaskell()
augroup END

function! CreateHaskell()
    let fname = expand("%:t")
    let fclassname = substitute(fname,"\\.hs","","g")
    :execute "normal imodule " . fclassname . " (T) where"
    :execute "normal FTs"
endfunction

"Makefile
augroup makefile_creation
    autocmd!
    autocmd BufNewFile Makefile call CreateMakefile()
augroup END

function! CreateMakefile()
    :execute "normal aSHELL := /bin/bash"
    :execute "normal o"
    :execute "normal o.PHONY: all, clean, mrpeoper"
    :execute "normal o"
    :execute "normal o.SUFFIXES:"
    :execute "normal o"
    :execute "normal omrproper:clean"
    :execute "normal O"
    :execute "normal Oclean:"
    :execute "normal O"
    :execute "normal Oall:"
endfunction
