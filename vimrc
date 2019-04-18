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

function! NERDTreeToggleInCurDir()
  " If NERDTree is open in the current buffer
  if (exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1)
    exe ":NERDTreeClose"
  else
    if (expand("%:t") != '')
      exe ":NERDTreeFind"
    else
      exe ":NERDTreeToggle"
    endif
  endif
endfunction

syntax on
set nocompatible               " be improved
filetype off                   " required!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let vundle manage vundle
Bundle 'posva/vim-vue'
Bundle 'thaerkh/vim-workspace'
Bundle 'metakirby5/codi.vim'
Bundle 'gmarik/vundle'
Bundle 'rayburgemeestre/phpfolding.vim'
Bundle 'Townk/vim-autoclose'
Bundle 'junegunn/fzf.vim'
Bundle 'junegunn/fzf'
Bundle 'Shougo/unite.vim'
Bundle 'Shougo/vimproc.vim'
Bundle "junegunn/seoul256.vim"
Bundle 'mileszs/ack.vim'
Bundle 'tpope/vim-repeat'
Bundle 'jelera/vim-javascript-syntax'
Bundle 'tpope/vim-surround'
Bundle 'matchit.zip'
Bundle 'groenewege/vim-less'
Bundle '2072/PHP-Indenting-for-VIm'
Bundle 'Valloric/MatchTagAlways'
Bundle 'bufkill.vim'
Bundle 'phtml.vim'
Bundle 'yonchu/accelerated-smooth-scroll'
Bundle 'bling/vim-airline'
Bundle 'tomtom/tcomment_vim'
Bundle 'argtextobj.vim'
Bundle 'ton/vim-bufsurf'
Bundle 'kana/vim-textobj-user'
Bundle 'Raimondi/vim_search_objects'
Bundle 'rhysd/clever-f.vim'
Bundle 'goldfeld/vim-seek'
Bundle 'kana/vim-textobj-indent'
Bundle 'tpope/vim-dispatch'
Bundle 'davidhalter/jedi-vim'
Bundle 'othree/javascript-libraries-syntax.vim'
Bundle 'joonty/vdebug.git'
Bundle 'scrooloose/nerdtree'
Bundle 'szw/vim-maximizer'
Bundle 'dsawardekar/wordpress.vim'
Bundle 'vim-scripts/marvim'
Bundle 'vim-syntastic/syntastic'
Bundle 'Quramy/tsuquyomi'
Bundle 'leafgarland/typescript-vim'
Bundle 'Quramy/vim-js-pretty-template'
Bundle 'jason0x43/vim-js-indent'
Bundle 'Yggdroot/indentLine'
Bundle 'lvht/phpcd.vim'
Bundle 'Shougo/deoplete.nvim'
Bundle 'chrisbra/csv.vim'




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


nnoremap <leader>m :call NERDTreeToggleInCurDir()<cr>

set wildignore+=**/node_modules/*,**.git/*,**uploads/*,**.bak/*,**.png,**.jpg
"let g:CommandTMaxFiles=500000
"let g:CommandTMaxHeight = 30
"let g:CommandTFileScanner = 'watchman'
"let g:CommandTMaxCachedDirectories = 0
"let g:CommandTInputDebounce = 200
"let g:CommandTRecursiveMatch = 0

nnoremap <leader>t :FZF<cr>
nnoremap <leader>b :Buffers<cr>

let g:ackprg = 'ag --nogroup --nocolor --column'
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

" Return to last edit position when opening files (You want this!)
 autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close

set viminfo^=%

" yss-
autocmd FileType php let b:surround_45 = "<?php \r ?>"

set undodir=~/.vim/undos
set undofile
set undolevels=1000 "maximum number of changes that can be undone
set undoreload=10000 "maximum number lines to save for undo on a buffer reload
set magic
set encoding=utf-8
set nowb
set noswapfile

let &showbreak = '↳ '
runtime macros/matchit.vim

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


let g:syntastic_mode_map={'mode': 'passive'}
let g:syntastic_auto_loc_list=2
let g:syntastic_enable_signs=1
"let g:syntastic_quiet_warnings=1
let g:syntastic_quiet_messages = {'level': 'warnings'}
let g:syntastic_php_phpcs_args = "-n --standard=Wordpress"
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_php_checkers = ['phpcs']
let g:syntastic_check_on_open = 1


set updatetime=500

set tabstop=2 softtabstop=2 shiftwidth=2 noexpandtab
"#set listchars=tab:▸\ ,eol:¬,space:␣
"set list

highlight SignColumn ctermfg=none ctermbg=none

let Tlist_Show_One_File = 1

filetype plugin indent on
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType python setlocal completeopt-=preview

"allowing to open new buffer without saving current
set hidden
set t_Co=256
colo seoul256
let g:seoul256_background = 236

set fillchars+=stl:\ ,stlnc:\

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#eclim#enabled = 1
let g:airline#extensions#tabline#tab_min_count = 2
let g:airline#extensions#tabline#show_buffers = 0


let NERDTreeIgnore=['__pycache__', 'node_modules', '__init__.py', '\~$']
let g:NERDTreeWinSize=60

set fileencoding=utf-8

if executable('ag')
   set grepprg=ag\ -o\ -U\ --nogroup\ --nocolor
 endif
" Treat long lines as break lines (useful when moving around in them)

"map j gj
"map k gk

nmap <leader>y :BreakpointRemove *<cr>

set timeoutlen=1000 ttimeoutlen=0
let g:workspace_session_disable_on_args = 1
let g:workspace_autosave_always = 1
let g:workspace_autosave_untrailspaces = 0
let g:workspace_undodir='.undodir'

tnoremap <Esc> <C-\><C-n>:q!<CR>


let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_faster = 1
let g:codi#width = 50.00
let g:codi#rightalign = 0


command Php execute ":new <bar> :Codi php <bar> :startinsert"

let g:typescript_compiler_binary = 'tsc'
let g:typescript_compiler_options = '--experimentalDecorators=true --lib=es2015'

map <F4> :let $VIM_DIR=expand('%:p:h')<CR>:terminal<CR>cd $VIM_DIR<CR>

autocmd BufEnter term://* startinsert



set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_php_checkers = ['php']

  let g:syntastic_mode_map = {
        \ "mode": "active",
        \ "active_filetypes": ["php"],
        \ "passive_filetypes": ["javascript"] }

let g:deoplete#enable_at_startup = 1

let g:deoplete#ignore_sources = get(g:, 'deoplete#ignore_sources', {})
let g:deoplete#ignore_sources.php = ['omni']
