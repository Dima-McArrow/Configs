syntax enable
colorscheme monokai
" Status bar
set laststatus=2
" Show line numbers
set number
" Encoding
set encoding=utf-8
" hope delete works
set backspace=indent,eol,start

" FILE BROWSING
" Tweaks for browsing
let g:netrw_banner=0 " disable the banner
let g:netrw_browse_split=4 " open in prior window
let g:netrw_altv=1 " open split to the right
let g:netrw_liststyle=3 " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'
" Now I can:
" - :edit a folder to open a file browser
" - <CR>/v/t to open in an h-split/v-split/tab
" - check |netrw-browse-maps| for more mappings
