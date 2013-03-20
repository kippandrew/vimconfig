" configure runtime path
let &runtimepath = printf('%s', $VIMRUNTIME)
let s:portable = expand('<sfile>:p:h')
let &runtimepath = printf('%s/vim/,%s', s:portable, &runtimepath)

" configure other plugins
let &runtimepath = printf('%s,%s/vim/bundle/ctrlp.vim/', &runtimepath, s:portable)

" compat stuff
set modelines=0     " CVE-2007-2438
set nocompatible    "Use Vim defaults instead of 100% vi compatibility
set backspace=2     " more powerful backspacing

set viminfo='20,\"50

" ui
set number
set ruler
set bg=dark
set backspace=indent,eol,start
set showmatch
set autoindent
set smartindent
highlight SpecialKey ctermfg=DarkGray

" spelling
let &spellfile = printf('%s/vim/spell/en.utf-8.add', s:portable)

" list
set list
set listchars=tab:>-
set listchars+=trail:.

" search
set hlsearch
set incsearch
set ignorecase
set smartcase

" default tab settings
set tabstop=4
set shiftwidth=4
set expandtab

filetype plugin indent on

let g:python_version_2 = 1
let g:python_highlight_all = 1

augroup detectfiletype
  autocmd BufNewFile,BufRead *.txt set filetype=human
  autocmd BufNewFile,BufRead *.ino set filetype=ino
  autocmd BufNewFile,BufRead *.json set filetype=json
augroup END

augroup ino
  autocmd FileType ino set syntax=c
  autocmd FileType ino set tabstop=2
  autocmd FileType ino set shiftwidth=2
  autocmd FileType ino set expandtab
augroup END

augroup python
  autocmd FileType python set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
  autocmd FileType python set tabstop=4
  autocmd FileType python set shiftwidth=4
  autocmd FileType python set expandtab
  autocmd FileType python highlight OverLength ctermbg=red ctermfg=white guibg=#592929
  autocmd FileType python match OverLength /\%81v.\+/
augroup END

augroup ruby
  autocmd FileType ruby set tabstop=2
  autocmd FileType ruby set shiftwidth=2
  autocmd FileType ruby set expandtab
augroup END

augroup javascript
  autocmd FileType json set syntax=javascript
  autocmd FileType json set tabstop=4
  autocmd Filetype json set shiftwidth=4
  autocmd FileType json set expandtab
augroup END

"vim jumps always to the last edited line, if possible
autocmd BufRead *,.* :normal '"
autocmd BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\   exe "normal g`\"" |
\ endif

"in human-language files, automatically format everything at 80 chars:
autocmd FileType mail,human
   \ set formatoptions+=t textwidth=80 nocindent

" enable syntax 
syntax enable

