call plug#begin("~/.config/nvim/bundle")

"NERDtree
Plug 'scrooloose/nerdtree', 

"Airline
Plug 'vim-airline/vim-airline',
Plug 'vim-airline/vim-airline-themes',

"Airline Settings
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''

"Ack
Plug 'mileszs/ack.vim'

"Theme palenight
Plug 'drewtempelmeyer/palenight.vim'

"IndentLine
Plug 'Yggdroot/indentLine'

"IndentLine setting
let g:indentLine_char = '┆'

"Git fugitive
Plug 'tpope/vim-fugitive'

"vim-polyglot
Plug 'sheerun/vim-polyglot'

"jsx-pretty setting
highlight def link jsxPunct Identifier
highlight def link jsxCloseString Identifier

"Coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"CommandT
"Plug 'wincent/Command-T', {'do': 'cd ruby/command-t/ext/command-t && ruby extconf.rb && make'}
"let g:CommandTCancelMap='<c-[>'

call plug#end()
