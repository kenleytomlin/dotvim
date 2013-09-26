"" I found this on the internet
"" http://net.tutsplus.com/articles/general/top-10-pitfalls-when-switching-to-vim/
"" https://github.com/carlhuda/janus
"" http://xkcd.com/1172/


"" PATHOGEN!!!!!!!!!!!!!!
" execute pathogen#infect()
" execute pathogen#helptags()

"" Basic Setup
set nocompatible      " Use vim, no vi defaults
set number            " Show line numbers
set ruler             " Show line and column number
syntax on             " Turn on syntax highlighting allowing local overrides
filetype plugin indent on
set encoding=utf-8    " Set default encoding to UTF-8

"" Whitespace
set wrap
" set nowrap                        " don't wrap lines
set tabstop=2                     " a tab is two spaces
set softtabstop=2
set shiftwidth=2                  " an autoindent (with <<) is two spaces
set expandtab                     " use spaces, not tabs
set list                          " Show invisible characters
set backspace=indent,eol,start    " backspace through everything in insert mode

set linespace=3
set textwidth=78
set formatoptions=qrn1
set formatoptions+=w

"" Indentation
set smartindent
set autoindent

" List chars
set listchars=""                  " Reset the listchars
set listchars=tab:\ \             " a tab should display as "  ", trailing whitespace as "."
set listchars+=trail:.            " show trailing spaces as dots
set listchars+=extends:>          " The character to show in the last column when wrap is
                                  " off and the line continues beyond the right of the screen
set listchars+=precedes:<         " The character to show in the last column when wrap is
                                  " off and the line continues beyond the right of the screen
"" Searching
set hlsearch    " highlight matches
set incsearch   " incremental searching
set ignorecase  " searches are case insensitive...
set smartcase   " ... unless they contain at least one capital letter
nmap <silent> ,/ :nohlsearch<CR>

"" Wildcard settings
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*
set wildignore+=*.swp,*~,._*

"" Backup and swap files
set backupdir^=~/Dropbox/backups/vim-backups/_backup//    " where to put backup files.
set directory^=~/Dropbox/backups/vim-backups/_temp//      " where to put swap files.
set nobackup
set nowritebackup
set noswapfile

"" <leader>
let mapleader = ","
set timeoutlen=500

"" Search
set incsearch
set hlsearch
set ignorecase
set smartcase

"" GUI
set t_Co=256
let g:solarized_termtrans = 1
colorscheme solarized
set guifont=Inconsolata\ for\ Powerline:h14
set guioptions=aAce
if has('gui_running')
  set go-=T
  if has("autocmd")
    autocmd VimEnter * NERDTree
    autocmd Vimenter * wincmd p
  endif
else
  set mouse=a
endif

" Toggle background color
" This is being weird
" call togglebg#map("<F5>")

if exists("g:enable_mvim_shift_arrow")
  let macvim_hig_shift_movement = 1 " mvim shift-arrow-keys
endif

"" at least let yourself know what mode you're in
set showmode

"" hard-wrap paragraphs of text
nnoremap <leader>q gqip

"" enable code folding
" set foldenable
set foldmethod=indent
set foldlevelstart=99
set nofoldenable

"" hide mouse when typing
set mousehide

"" shortcut to fold tags with leader (usually \) + ft
nnoremap <leader>ft Vatzf

"" opens a vertical split and switches over (\v)
nnoremap <leader>v <C-w>v<C-w>l

"" split windows below the current window.
set splitbelow

"" session settings
set sessionoptions=resize,winpos,winsize,buffers,tabpages,folds,curdir,help

"" faster shortcut for commenting. Requires T-Comment plugin
map ,c <c-_><c-_>

"" map code completion to , + tab
imap ,<tab> <C-x><C-o>

"" map escape key to jj -- much faster
imap jk <esc>

"" set text wrapping toggles
nmap <silent> <leader>tw :set invwrap<CR>:set wrap?<CR>

"" find merge conflict markers
nmap <silent> <leader>fc <ESC>/\v^[<=>]{7}( .*\|$)<CR>

"" window navigation
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

"" highlight brackets
hi MatchParen cterm=bold ctermbg=darkmagenta ctermfg=white

"" yank text to the OS X clipboard
set clipboard=unnamed
noremap <leader>y "+y
noremap <leader>yy "+yy

"" preserve indentation while pasting text from the OS X clipboard
noremap <leader>p :set paste<CR>:put  *<CR>:set nopaste<CR>

"" line length
set colorcolumn=80

"" spellcheck
map <leader>ss :setlocal spell!<cr>

"" shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

"" Up/Down keys move by row, rather than line
nnoremap j gj
nnoremap k gk

"" switch buffers without saving
"set hidden

"" Unimpaired
nmap <space>n ]b
nmap <space>p [b
" nnoremap <C-Space> ]b

"" Indent Guides
let g:indent_guides_enable_on_vim_startup = 0
let g:indent_guides_color_change_percent = 5
let g:indent_guides_space_guides = 1
nmap <silent> <Leader>ig <Plug>IndentGuidesToggle

"" Nerd Tree
nmap ,nt :NERDTreeToggle
nmap ,ntt :NERDTreeTabsToggle
let NERDTreeShowHidden=1

" Airline, a powerline replacement
" let g:airline_powerline_fonts = 1

"Powerline 2
set rtp+=/usr/local/lib/python2.7/site-packages/powerline/bindings/vim

"" Blockify
let g:blockify_pairs = {
  \ 'c':    [ '{', '}' ],
  \ 'cpp':  [ '{', '}' ],
  \ 'java': [ '{', '}' ],
  \ 'php': [ '{', '}' ],
  \ 'css': [ '{', '}' ],
  \ 'scss.css': [ '{', '}' ],
  \ 'scss': [ '{', '}' ],
  \ 'javascript': [ '{', '}' ],
  \ 'php.drupal': [ '{', '}' ],
  \}

"" Reload .vimrc after editing and saving
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif

au BufRead,BufNewFile *.scss set filetype=scss

"" Sup CTRL-P
let g:ctrlp_by_filename = 1

" JS enhanced syntax
au FileType javascript call JavaScriptFold()

" Numbers
let g:numbers_exclude = ['nerdtree']
