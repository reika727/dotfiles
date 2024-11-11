syntax on
filetype plugin indent on
set expandtab
set shiftwidth=0
noremap j gj
noremap k gk
highlight MyExtraSpace ctermbg=lightgreen
match MyExtraSpace /　\|\(\s\|　\)\+$/
autocmd Filetype c,cpp,objc setlocal tabstop=4
autocmd Filetype haskell setlocal tabstop=2
set backspace=indent,eol,start
augroup mycmds
    autocmd!
    if has("win64")
            autocmd TextYankPost * :call system('/mnt/c/Windows/System32/clip.exe',@")
    elseif has("mac")
            set clipboard=unnamed
    endif
augroup END
