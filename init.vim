source ~/.config/nvim/pluggin.vim
source ~/.config/nvim/mapping.vim
source ~/.config/nvim/localMapping.vim
source ~/.config/nvim/abreviation.vim
source ~/.config/nvim/createFile.vim

"Theme
filetype on
syntax on
set background=dark
colorscheme gruvbox
set cursorline " highlight current line
set showtabline=0 "hide the tab line

"General setting
set nocompatible 
set nofixeol "avoid to add empty line at the end of file
set number "add number
set secure " disable unsafe commands
set noswapfile "no swap file when file open
set wildoptions=tagfile "have only tag change since nvim 4.0
set splitbelow " Open new split panes to bottom
set splitright " Open new split panes to right 
set lazyredraw "don't redraw during macro


set nrformats= "all number is decimal
set clipboard^=unnamed "set clipboard the default register
set timeoutlen=100000 "allow to take as much time as needed to shortcut
set suffixesadd+=.java,.hpp,.cpp,.py,.txt,.css,.scss,.jsx,.erb,.hs,.html,.bib,.tex,.lua
set wildignore+=*.o,*.class,*.mp3,*.pdf,*.zip,*.tar,*.rar,*.png,*.jpg,*.svg,.DS_Store,*.hi,.git

"Indentation
filetype indent on
set tabstop=4 "number of space = tab
set shiftwidth=4
set smartindent
set expandtab " use space and no tab

"Search option
set hlsearch incsearch " highlight match and move cursor to first match
set ignorecase " ignore case 
set smartcase " unless specific maj key

"Nvim nested
if has('nvim') && executable('nvr')
    let $EDITOR= "nvr -cc split --remote-wait +'set bufhidden=wipe'"
    let $VISUAL= "nvr -cc split --remote-wait +'set bufhidden=wipe'"
endif

"Undo persistent
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

" Vim jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"zz" | endif
endif


lua require("init")
