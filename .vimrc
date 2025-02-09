syntax on
filetype plugin indent on

set expandtab
set shiftwidth=0
set backspace=indent,eol,start

noremap j gj
noremap k gk

highlight MyExtraSpace ctermbg=lightgreen
highlight CocFloating ctermbg=DarkGrey
match MyExtraSpace /　\|\(\s\|　\)\+$/

autocmd Filetype c,cpp,objc setlocal tabstop=4
autocmd Filetype haskell setlocal tabstop=2

augroup mycmds
    autocmd!
    if has("win64")
            autocmd TextYankPost * :call system('/mnt/c/Windows/System32/clip.exe',@")
    elseif has("mac")
            set clipboard=unnamed
    endif
augroup END

call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()
