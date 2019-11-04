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
    autocmd FileType java iabbrev <buffer> dmain public static void main(String[] args){<CR>}<esc>O<C-R>=Eatchar('\s')<CR>
    autocmd FileType java iabbrev <buffer> tryc try{<esc>j>}}i}<CR>catch(E e){<CR>}<esc>kfEs<C-R>=Eatchar('\s')<CR>
    autocmd FileType java iabbrev <buffer> trye try{<esc>j>}}i}<esc>kocatch(E e){<CR>}<esc>kfEs<C-R>=Eatchar('\s')<CR>

    "cpp
    autocmd FileType cpp iabbrev <buffer> sout std::cout<<M<<std::endl;<esc>FMxi<C-R>=Eatchar('\s')<CR>
    autocmd FileType cpp iabbrev <buffer> #i #include
    autocmd FileType cpp iabbrev <buffer> dmain int main(int argc, char *argv[]){<CR>}<esc>O<C-R>=Eatchar('\s')<CR>
    autocmd FileType cpp iabbrev <buffer> tempT template<typename T><C-R>=Eatchar('\s')<CR>

    "ruby
    autocmd FileType ruby iabbrev <buffer> sout puts()<esc>i<C-R>=Eatchar('\s')<CR>

    "python
    autocmd FileType python iabbrev <buffer> fori for i in range():<esc>hi<C-R>=Eatchar('\s')<CR>
    autocmd FileType python iabbrev <buffer> sout  print()<esc>i<C-R>=Eatchar('\s')<CR>
    autocmd FileType python iabbrev <buffer> ifmain  if __name__ == "__main__":<esc>o<C-R>=Eatchar('\s')<CR>

    "css + scss
    autocmd FileType css,scss iabbrev <buffer> wonly @media only screen and (max-width: 1140px) {<esc>o}<esc>O<C-R>=Eatchar('\s')<CR>

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
augroup END
