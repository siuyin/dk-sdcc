syntax on
filetype plugin indent on
color ron
set autowrite
set nocompatible
set listchars+=space:.

map <C-n> :cnext<CR>
map <C-m> :cprev<CR>
noremap <leader>a :cclose<CR>
noremap <leader>f :% !astyle  --style=java --indent=tab=8 --pad-oper<CR>
let g:go_list_type = "quickfix"
let g:go_metalinter_command = "golangci-lint"
let g:go_metalinter_deadline = "10s"
let g:go_fmt_command = "goimports"
let g:go_pls_enabled = 1
let g:go_rename_command = 'gopls'

autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)

set guifont=Source_Code_Pro:h11:cANSI:qDRAFT

autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab autoindent
autocmd FileType css  setlocal ts=2 sts=2 sw=2 expandtab autoindent
autocmd FileType javascript setlocal ts=2 sts=2 sw=2 expandtab autoindent

