
let &runtimepath = printf('%s/vimfiles,%s,%s/vimfiles/after', $VIM, $VIMRUNTIME, $VIM)

" what is the name of the directory containing this file?
let s:portable = expand('<sfile>:p:h')

" add the directory to 'runtimepath'
let &runtimepath = printf('%s,%s,%s/after', s:portable, &runtimepath, s:portable)

" plugins
let &runtimepath = printf('%s,%s/bundle/ctrlp.vim', &runtimepath, s:portable)

set modelines=0     " CVE-2007-2438
set nocompatible    "Use Vim defaults instead of 100% vi compatibility
set backspace=2     " more powerful backspacing

syntax on
set number
set bg=dark
set ai
set showmatch
highlight SpecialKey ctermfg=DarkGray
set listchars=tab:>-,trail:~
set list
set hlsearch

" default tab settings
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent

" per filetype settings
autocmd FileType python set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType python set tabstop=4
autocmd FileType python set shiftwidth=4
autocmd FileType python set expandtab

autocmd FileType ruby set tabstop=2
autocmd FileType ruby set shiftwidth=2
autocmd FileType ruby set expandtab

autocmd BufNewFile,BufRead *.json set tabstop=4
autocmd BufNewFile,BufRead *.json set shiftwidth=4
autocmd BufNewFile,BufRead *.json set expandtab
autocmd BufNewFile,BufRead *.json set syntax=javascript

set listchars=tab:>-
set listchars+=trail:.
set ignorecase
set smartcase
