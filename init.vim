source ~/.config/nvim/pluggin.vim
source ~/.config/nvim/mapping.vim
source ~/.config/nvim/localMapping.vim
source ~/.config/nvim/abreviation.vim
source ~/.config/nvim/createFile.vim

"Theme
filetype on
syntax on
set background=dark
colorscheme palenight
set cursorline " highlight current line
let g:airline_theme='palenight'
let &colorcolumn='80,120' "add mark at column 80 and 120 to have visual mark for the number of char 
set showtabline=0 "hide the tabline

"General setting
set nocompatible 
set nofixeol "avoid to add empty line at the end of file
set number "add number
set secure " disable unsafe commands in local .vimrc files
set noswapfile "no swp file when file open
set wildoptions=tagfile "have only tag change since nvim 4.0
set splitbelow " Open new split panes to bottom
set splitright " Open new split panes to right 
set lazyredraw "don't redraw during macro
set nrformats= "all number is decimal
set timeoutlen=100000 "allow to map wit existente key
set suffixesadd=.java,.hpp,.cpp,.py,.txt,.css,.scss,.jsx,.erb,.hs
set wildignore=*.o,*.class,*.mp3,*.pdf,*.zip,*.tar,*.rar,*.png,*.jpg,*.svg,.DS_Store,*.hi
let g:CommandTWildIgnore=&wildignore . ",*/node_modules/*" .",*/tmp/*" . ",*/solr/*"

"Indentation
filetype indent on
set nowrap
set tabstop=4 "number of space = tab
set shiftwidth=4
set smartindent
set expandtab " use space and no tab

"Search option
set hlsearch incsearch " highligtht match and move cursor to first match
set ignorecase " ignore casse 
set smartcase " unlesse specifique maj key

"Nvim nested
if has('nvim') && executable('nvr')
    let $EDITOR= "nvr -cc split --remote-wait +'set bufhidden=wipe'"
    let $VISUAL= "nvr -cc split --remote-wait +'set bufhidden=wipe'"
endif

"Undo persistan
set undofile
augroup noUndoPersistantTemp
    autocmd!
    autocmd BufWritePre /tmp/* set noundofile
augroup END

"Auto resize of split
augroup autoresize
    autocmd!
    autocmd VimResized * wincmd =
augroup END

"Auto reload setting files
augroup autosetting
    autocmd!
    autocmd BufWritePost ~/.config/nvim/*.vim :source $MYVIMRC
augroup end
