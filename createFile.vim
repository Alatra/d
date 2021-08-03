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
    :execute "normal oclass ".fclassname." {"
    :execute "normal ^w~"
    :execute "normal opublic:"
    :execute "normal o".fclassname."();"
    :execute "normal ^~"
    :execute "normal o".fclassname."(const ".fclassname."&) = default;"
    :execute "normal ^~W~"
    :execute "normal o".fclassname."& operator=(const ".fclassname."&) = default;"
    :execute "normal ^~WW~"
    :execute "normal o~".fclassname."() = default;"
    :execute "normal ^l~"
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
    :execute "normal oALL_FLAGS= -std=c++17 -Wpedantic -Wall -Wextra -Wconversion -Weffc++ -Wstrict-null-sentinel -Wnoexcept -Wctor-dtor-privacy -Woverloaded-virtual -Wsign-promo -Wsuggest-final-types -Wsuggest-final-methods -Wsuggest-override -Wold-style-cast -Wzero-as-null-pointer-constant"
    :execute "normal oCC = g++-10"
    :execute "normal o"
    :execute "normal o.PHONY: all, clean, mrproper"
    :execute "normal o"
    :execute "normal o.SUFFIXES:"
    :execute "normal o"
    :execute "normal omrproper:clean"
    :execute "normal orm -rf main"
    :execute "normal kO"
    :execute "normal Oclean:"
    :execute "normal orm -rf *.o"
    :execute "normal kO"
    :execute "normal Oall: main"
    :execute "normal o"
    :execute "normal omain: main.cpp"
    :execute "normal o$(CC) $(ALL_FLAGS) $^ -o  $@" 
endfunction

"HTML
augroup html_creation
    autocmd!
    autocmd BufNewFile *.html call CreateHTML()
augroup END

function! CreateHTML()
    :execute "normal a<!DOCTYPE html>"
    :execute "normal o<meta content=\"text/html;charset=utf-8\" http-equiv=\"Content-Type\">"
    :execute "normal o<meta content=\"utf-8\" http-equiv=\"encoding\">"
    :execute "normal o"
    :execute "normal o<html>"
    :execute "normal o<head>"
    :execute "normal o<link rel=\"stylesheet\" href=\"styles.css\">"
    :execute "normal o<title>Random Title</title>"
    :execute "normal o</head>"
    :execute "normal o<body>"
    :execute "normal o</body>"
    :execute "normal o</html>"
endfunction
