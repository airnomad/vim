"autoinstall vundle if not present on new macines
"
  let iCanHazVundle=1
    let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
    if !filereadable(vundle_readme)
        echo "Installing Vundle.."
        echo ""
        silent !mkdir -p ~/.vim/bundle
        silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
        let iCanHazVundle=0
    endif
    set rtp+=~/.vim/bundle/vundle/
    call vundle#rc()

syntax on
set nocompatible               " be improved
filetype off                   " required!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let vundle manage vundle
Bundle 'gmarik/vundle'
Bundle 'Townk/vim-autoclose'
Bundle 'Command-T'
Bundle 'scrooloose/syntastic'
Bundle 'taglist.vim'
Bundle "junegunn/seoul256.vim"
Bundle 'tpope/vim-fugitive'
Bundle 'StanAngeloff/php.vim'
Bundle 'mileszs/ack.vim'
Bundle 'Tail-Bundle'
Bundle 'tpope/vim-repeat'
Bundle 'scrooloose/nerdtree'
Bundle 'jelera/vim-javascript-syntax'
Bundle 'simplefold'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim.git'
Bundle 'tpope/vim-surround'
Bundle 'matchit.zip'
Bundle 'groenewege/vim-less'
Bundle '2072/PHP-Indenting-for-VIm'
Bundle 'Valloric/MatchTagAlways'
Bundle 'bufkill.vim'
Bundle 'phtml.vim'
Bundle 'yonchu/accelerated-smooth-scroll'
Bundle 'bling/vim-airline'
Bundle 'tpope/vim-commentary'
Bundle 'argtextobj.vim'
Bundle 'ton/vim-bufsurf'
Bundle 'kana/vim-textobj-user'
Bundle 'Raimondi/vim_search_objects'
Bundle 'justinmk/vim-sneak'
Bundle 'kana/vim-textobj-indent'
Bundle 'tpope/vim-dispatch'
Bundle 'davidhalter/jedi-vim'

map <f10> <esc>:disablephpfolds<cr>
map <f12> <esc>:TlistToggle<cr>
map <f3> :PhpSearchContext<cr>

" don't screw up folds when inserting text that might affect them, until
" leaving insert mode. foldmethod is local to the window. protect against
" screwing up folding when switching between windows.
autocmd insertenter * if !exists('w:last_fdm') | let w:last_fdm=&foldmethod | setlocal foldmethod=manual | endif
autocmd insertleave,winleave * if exists('w:last_fdm') | let &l:foldmethod=w:last_fdm | unlet w:last_fdm | endif

autocmd insertenter * set nocursorline!
autocmd insertleave * set cursorline!

set cursorline!
hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white


"faster window browsing
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l


set wildmode=list:longest
let mapleader = ","

" disable arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

map <leader>h :BufSurfBack<cr>	
map <leader>l :BufSurfForward<cr>

let g:mta_filetypes = {
        \ 'html' : 1,
        \ 'xhtml' : 1,
        \ 'xml' : 1,
        \ 'php' : 1,
        \}
 

"returns true iff is NERDTree open/active
function! rc:isNTOpen()        
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" calls NERDTreeFind iff NERDTree is active, current window contains a
"    modifiable file, and we're not in vimdiff
function! rc:syncTree()
	   if rc:isNTOpen()
      		NERDTreeToggle
       else
      		NERDTreeFind
      endif
endfunction


map <leader>m :call rc:syncTree()<cr>

nmap <leader>w :w!<cr>
vmap č :
nmap č :
cmap č :

vmap ž /
cmap ž /
nmap ž /

nmap ć %
cmap ć %
vmap ć %

map <space> /


nmap <Leader>a  :call AckCommand()<CR>

function! AckCommand()
	  let i = split (input ('search for:', &ft . ',' . expand('<cword>')), ',')
		if len(i) > 0 && i[1] != ''
			execute ":Ack --" . i[0] . "  "  . i[1] 
		endif
endfunction 

" Return to last edit position when opening files (You want this!)
 autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close

set viminfo^=%



" set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim

" yss-
autocmd FileType php let b:surround_45 = "<?php \r ?>"

set undodir=~/.vim/undos
set undofile
set undolevels=1000 "maximum number of changes that can be undone
set undoreload=10000 "maximum number lines to save for undo on a buffer reload
set magic
set encoding=utf8
set nowb
set noswapfile

let &showbreak = '↳ '
runtime macros/matchit.vim

let g:manpageview_winopen="vsplit="
let g:nrrw_rgn_vert = 1
let g:nrrw_rgn_wdth = 50
set completeopt=longest,menu
set exrc
set ruler
set history=1000
set nowrap        " don't wrap lines
set backspace=indent,eol,start "allow backspacing over everything in insert mode
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type
set smartcase     " ignore case if search pattern is all lowercase,
                  "    case-sensitive otherwise
set number        " always show line numbers
set shiftwidth=2  " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set pastetoggle=<F2>
set laststatus=2 
set wrap
set textwidth=80
set linebreak
set nolist  " list disables linebreak
  
  
let g:syntastic_auto_loc_list=2
let g:syntastic_enable_signs=1
"let g:syntastic_quiet_warnings=1
let g:syntastic_quiet_messages = {'level': 'warnings'}
set updatetime=500

set tabstop=2 shiftwidth=2 expandtab

augroup mine
    au BufWinEnter * sign define mysign
    au BufWinEnter * exe "sign place 1337 line=1 name=mysign buffer=" . bufnr('%')
    au BufWinEnter * set relativenumber
augroup END

highlight SignColumn ctermfg=none ctermbg=none

let Tlist_Show_One_File = 1

filetype plugin indent on
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP 
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags


"allowing to open new buffer without saving current
set hidden
set t_Co=256
colors seoul256

set fillchars+=stl:\ ,stlnc:\
let g:notes_directories = ['~/docs/notes']

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#syntastic#enabled = 1 
let g:airline#extensions#eclim#enabled = 1
let g:airline#extensions#tabline#tab_min_count = 2
let g:airline#extensions#tabline#show_buffers = 0
let g:jedi#show_call_signatures = "0"

autocmd FileType python setlocal completeopt-=preview

let NERDTreeIgnore=['__pycache__', '__init__.py', '\~$']
