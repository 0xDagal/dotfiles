syntax on "Activate syntax
set noerrorbells
set tabstop=2 "How many spaces when a tab is pressed
set softtabstop=2 "How many spaces to add at the 
set shiftwidth=2 "How many spaces when you indent something
set expandtab "Insert spaces as tab is pressed
set smartindent
set number relativenumber " Hybrid number
set colorcolumn=80
set nowrap
set ignorecase "If you put ignorecase and smartcase then it's case sensitive
set smartcase "only if it has a uppercase letter
set noswapfile
set nobackup
set undofile "Undo branches are stored in files
set undodir=$XDG_CACHE_HOME/vim/undo " that are stored there
set incsearch "Permit to move to the pattern while searching
set nohlsearch "Do no highlight all pattern matches
set cursorline
let mapleader = " " " leader key set to  space
set runtimepath=$XDG_CONFIG_HOME/vim " Vim follow the XDG Base Dir Spec
" NerdTree like netrw
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25
" Open netrw with leader p
nnoremap <leader>p :Vexplore<CR>
" No F1 help
nmap <F1> <nop>
" Copy to clipboard
vmap <C-c> :!xclip -f -sel clip<CR>
" Some vim windows switching shortcuts
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
" Leader t to toggle a terminal into vim
nnoremap <leader>t :below ter<CR>
" Plugs are stored in .vim/pack as Vim 8 as plugin loader built-in
" Deactivate completion by default
let g:asyncomplete_auto_popup = 0 
" Deactivate highlight references
let g:lsp_document_highlight_enabled = 0
" Use C-t to toggle/untoggle completion
inoremap <C-t> <esc>:let g:asyncomplete_auto_popup = !g:asyncomplete_auto_popup<CR>a

/* vim: set filetype=vim : */
