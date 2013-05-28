" ======== General ======== 
set nocompatible
set autoread
set history=200
set encoding=utf-8
set laststatus=2
set notimeout
set ttimeout
autocmd! bufwritepost .vimrc source ~/.vimrc

cmap w!! w !sudo tee % >/dev/null

" ======== Interface ======== 
set ruler
set wildmenu
set wildignore=*.0,*~,*.pyc,*.class
set whichwrap+=<,>,h,l
set number
set scrolloff=8
set nowrap
set mouse=a

" ======== Folding ========  
inoremap <leader>f <C-O>za
nnoremap <leader>f za
onoremap <leader>f <C-C>za
"" open all folds
inoremap <leader>F <C-O>zR
nnoremap <leader>F zR
onoremap <leader>F <C-C>zR
set foldmethod=indent
set nofoldenable

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" bell
set noerrorbells
set visualbell
set t_vb=
set tm=500

" ======== highlight ======== 
filetype plugin indent on
syntax on
" colorscheme eclipse
colorscheme github
" colorscheme hemisu
" colorscheme nuvola
" colorscheme solarized
set background=dark

highlight OverLength ctermbg=red ctermfg=white
match OverLength /\%81v.\+/

" ======== Mapleader ======== 
let mapleader=","
let maplocalleader=","
let g:mapleader=","
"" Fast saving
nmap <leader>w :w!<CR>
"" new window
map <leader>n :new<CR>
"" clearing highlighted search
noremap <silent> <leader><ESC> :nohlsearch<CR>
vnoremap <silent> <leader><ESC> :nohlsearch<CR>
inoremap <silent> <leader><ESC> :nohlsearch<CR>

" ======== Search ========
set hlsearch
set incsearch
set smartcase

" ======== File ========
set nobackup
set nowritebackup
set noswapfile
set showcmd

" ======== Indent ========
set autoindent
set cindent
set smartindent
set wrap
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab

set t_co=256

" Navi 
map j gj
map k gk

" tab switch
map <leader>1 1gt
map <leader>2 2gt
map <leader>3 3gt
map <leader>4 4gt
map <leader>5 5gt
map <leader>6 6gt
map <leader>7 7gt
map <leader>8 8gt
map <leader>9 9gt

" split window switch
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-l> :wincmd l<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-k> :wincmd k<CR>

" fcitx support
let g:input_toggle = 1
function! Fcitx2en()
    let s:input_status = system("fcitx-remote")
    if s:input_status == 2
        let g:input_toggle = 1
        let l:a = system("fcitx-remote -c")
    endif
endfunction
autocmd InsertLeave * call Fcitx2en()

" Pathogen
runtime! autoload/pathogen.vim
silent! call pathogen#helptags()
silent! call pathogen#runtime_append_all_bundles()
execute pathogen#infect()

" ======== Java ========
let java_comment_strings=1
let java_highlight_java_lang_ids=1
let java_highlight_all=1
let java_highlight_debug=1
let java_highlight_functions="style"
let java_minlines = 150

" Omni Java Completion
if has("autocmd")
    autocmd Filetype java setlocal omnifunc=javacomplete#Complete
endif
setlocal completefunc=javacomplete#Complete
inoremap <buffer> <C-X><C-U> <C-X><C-U><C-P>
inoremap <buffer> <C-S-Space> <C-X><C-U><C-P> 