" Start with plugins
call plug#begin('~/.vim/plugged')

" Themes
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'rktjmp/lush.nvim'
Plug 'mcchrish/zenbones.nvim'

" Other plugs
Plug 'ap/vim-buftabline'

call plug#end()


" Colors
syntax on
set background=light
colorscheme zenbones
set cursorline


" Modes etc
set nocompatible                " don't like vi ;)
set modeline                    " load filetype from file comment, if present
set fileformats=unix            " who uses DOS format? ;)
set showcmd                     " display commands in the bottom right
set noshowmode
set noautowrite
set hidden                      " Don't close buffers - switch buffers w/o save


" Highlight and Remove unwanted whitespace
autocmd   Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/
highlight ExtraWhitespace ctermbg=red guibg=#aa0000
autocmd   BufWritePre * %s/\s\+$//e


" Visuals
set ttyfast
set lazyredraw
set t_vb=                      " no bell at all
set noerrorbells               " no bell at all
set novisualbell               " no bell at all
set number
set relativenumber
set encoding=utf8
lang en_US.UTF-8
lang mes en_US.UTF-8


" Windows
set     splitbelow
set     splitright
autocmd VimResized * wincmd =


" Status bar
set laststatus=2
let g:airline_powerline_fonts=1
let g:airline_theme='solarized'


" Formatting
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set backspace=indent,eol,start  " backspace eats all!
set nojoinspaces                " No extra spaces after !, ., ?, etc.
set linebreak                   " don't break words
set display=lastline            " display as many lines as possible
set scrolloff=10                " always keep 10 lines above and below cursor
set virtualedit=block           " allow editing in block mode
set textwidth=0                 " force unlimited columns!


" File type autosense etc.
filetype on
filetype plugin on
filetype indent on

set smartcase                   " do smart case matching
set wrapscan                    " wrap at EOF
set showmatch                   " show matching brackets.
set completeopt=menu,preview
set infercase
set wildmenu
set wildmode=full
set autoread


" Custom keys

" make Y consisten with C and D
nnoremap Y y$

" highlight last inserted text
nnoremap gV `[v`]

" Surround with (), [], {}, "
nnoremap g( ciw()<ESC>P
nnoremap g[ ciw[]<ESC>P
nnoremap g{ ciw{}<ESC>P
nnoremap g" ciw""<ESC>P
nnoremap G( ciW()<ESC>P
nnoremap G[ ciW[]<ESC>P
nnoremap G{ ciW{}<ESC>P
nnoremap G" ciW""<ESC>P

" Better line navigation
nnoremap <expr> j v:count ? (v:count > 5 ? "m'" . v:count : '') . 'j' : 'gj'
nnoremap <expr> k v:count ? (v:count > 5 ? "m'" . v:count : '') . 'k' : 'gk'

" Annoying q:
map q: <Nop>

" Ctrl-a -> Select All, but only in normal mode
nnoremap <Leader>a <C-a>
nnoremap <C-a> ggVG
inoremap <C-a> <Nop>

" Make space/backspace work in normal mode, too
nnoremap <Space> i<Space><Esc>l
nnoremap <Bs> i<Bs><Esc>l

" K as 'opposite' of J
nnoremap K r<Cr>

" Buffer tabs
nnoremap <C-j> :bprev<Cr>
nnoremap <C-k> :bnext<Cr>

" make n always search forward and N backward
nnoremap <expr> n 'Nn'[v:searchforward]
nnoremap <expr> N 'nN'[v:searchforward]

" make ; always "find" forward and , backward
nnoremap <expr> ; getcharsearch().forward ? ';' : ','
nnoremap <expr> , getcharsearch().forward ? ',' : ';'


" make commands with ge consistent with b and w
onoremap ge :execute "normal! " . v:count1 . "ge<space>"<cr>


" Automatically CD into open file directory
autocmd BufEnter * silent! lcd %:p:h


" Better git commit messages
autocmd Filetype gitcommit setlocal spell textwidth=50 colorcolumn=+1


" Set path to calling directory + subdirectories
set path=$PWD/**


" C/C++ Related

set tags=.tags;/

" Force .h and .c to be C files
autocmd BufNewFile,BufRead *.h,*.c setfiletype c
" Force .hh and .cc to be C++ files
autocmd BufNewFile,BufRead *.hh,*.cc setfiletype cpp

set cinoptions+=g0
set cinoptions+=t0

" Python
let python_highlight_all = 1

" Cisco
" Force .ios to be cisco file
autocmd BufNewFile,BufRead *.ios,*.xr setfiletype cisco

" Juniper
" Force .jp to be juniper file
autocmd BufNewFile,BufRead *.jp setfiletype junos
autocmd BufNewFile,BufRead *.junos setfiletype junos

" Man pages
runtime! ftplugin/man.vim

" Sort Group
runtime! autoload/SortGroup.vim
