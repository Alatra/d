func! Eatchar(pat)
    let c = nr2char(getchar(0))
    return (c =~ a:pat) ? '' : c
endfunc

augroup abreviation
    autocmd!

    "java + cpp
    autocmd FileType java,cpp iabbrev <buffer> fori for(int i = 0 ; i <2 ; i++ ){<CR>}<esc>kf2s
    autocmd FileType java,cpp iabbrev <buffer> forj for(int j = 0 ; j <2 ; j++ ){<CR>}<esc>kf2s
     
    "java
    autocmd FileType java iabbrev <buffer> sout System.out.println();<esc>F)i<C-R>=Eatchar('\s')<CR>
    autocmd FileType java iabbrev <buffer> souT System.out.print();<esc>F)i<C-R>=Eatchar('\s')<CR>
    autocmd FileType java iabbrev <buffer> imain public static void main(String[] args){<CR>}<esc>O<C-R>=Eatchar('\s')<CR>
    autocmd FileType java iabbrev <buffer> tryc try{<esc>j>}}i}<CR>catch(E e){<CR>}<esc>kfEs<C-R>=Eatchar('\s')<CR>
    autocmd FileType java iabbrev <buffer> trye try{<esc>j>}}i}<esc>kocatch(E e){<CR>}<esc>kfEs<C-R>=Eatchar('\s')<CR>

    "cpp
    autocmd FileType cpp iabbrev <buffer> sout std::cout<<<<std::endl;<esc>3F<a<C-R>=Eatchar('\s')<CR>
    autocmd FileType cpp iabbrev <buffer> #i #include
    autocmd FileType cpp iabbrev <buffer> imain int main(int argc, char *argv[]){<CR>}<esc>O<C-R>=Eatchar('\s')<CR>
    autocmd FileType cpp iabbrev <buffer> tempT template<typename T><C-R>=Eatchar('\s')<CR>

    "ruby
    autocmd FileType ruby iabbrev <buffer> sout puts()<esc>i<C-R>=Eatchar('\s')<CR>

    "python
    autocmd FileType python iabbrev <buffer> fori for i in range():<esc>hi<C-R>=Eatchar('\s')<CR>
    autocmd FileType python iabbrev <buffer> sout  print()<esc>i<C-R>=Eatchar('\s')<CR>
    autocmd FileType python iabbrev <buffer> imain  if __name__ == "__main__":<esc>o<C-R>=Eatchar('\s')<CR>

    "css + scss
    autocmd FileType css,scss iabbrev <buffer> wonly @media only screen and (max-width: 1140px) {<esc>o}<esc>O<C-R>=Eatchar('\s')<CR>

    "html
    autocmd FileType html iabbrev <buffer> ihtml <!DOCTYPE html><CR><meta content="text/html;charset=utf-8" http-equiv="Content-Type"><CR><meta content="utf-8" http-equiv="encoding"><CR><html><CR><head><CR><title>M</title><CR></head><CR><body><CR></body><CR></html><esc>6GfMs<C-R>=Eatchar('\s')<CR>
    autocmd FileType html iabbrev <buffer> odiv <div class=""><CR></div><esc>kf"a<C-R>=Eatchar('\s')<CR>

    "javascript 
    autocmd FileType javascript,javascriptreact iabbrev <buffer> sout console.log()<esc>i<C-R>=Eatchar('\s')<CR>
    autocmd FileType javascrip,javascriptreact iabbrev <buffer> tpro this.props.<C-R>=Eatchar('\s')<CR>
    autocmd FileType javascrip,javascriptreact iabbrev <buffer> tsta this.state.<C-R>=Eatchar('\s')<CR>
    autocmd FileType javascrip,javascriptreact iabbrev <buffer> fori for(let i = 0 ; i <2 ; i++ ){<CR>}<esc>kf2s
    autocmd FileType javascrip,javascriptreact iabbrev <buffer> odiv <div className=""><CR></div><esc>kf"a<C-R>=Eatchar('\s')<CR>
    autocmd FileType javascrip,javascriptreact iabbrev <buffer> ediv <div className="" /><esc>F"i<C-R>=Eatchar('\s')<CR>

    "haskell
    autocmd FileType haskell iabbrev <buffer> imain main=putStrLn "Hello, World!"
    autocmd FileType haskell iabbrev <buffer> sout putStrLn

    "lua
    autocmd FileType lua iabbrev <buffer> sout print(T)<esc>FTs<C-R>=Eatchar('\s')<CR>

    "tex
    autocmd FileType tex iabbrev <buffer> bitem \begin{itemize}<esc>o\end{itemize}<esc>O\item{}<esc>i<C-R>=Eatchar('\s')<CR>
    autocmd FileType tex iabbrev <buffer> <- \leftarrow

augroup END
