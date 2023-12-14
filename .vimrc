syntax on
filetype plugin indent on
set expandtab
set shiftwidth=0
noremap j gj
noremap k gk
highlight MyExtraSpace ctermbg=lightgreen
match MyExtraSpace /　\|\(\s\|　\)\+$/
autocmd Filetype c,cpp setlocal tabstop=4
autocmd Filetype haskell setlocal tabstop=2
augroup mycmds
    autocmd!
    autocmd TextYankPost * :call system('/mnt/c/Windows/System32/clip.exe',@")
augroup END
