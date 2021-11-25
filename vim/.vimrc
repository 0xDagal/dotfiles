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
set undodir=~/.vim/undodir "Undo files are stored there
set incsearch "Permit to move to the pattern while searching
set nohlsearch "Do no highlight all pattern matches
set cursorline
let mapleader = " " " leader key set to  space
" NerdTree like netrw see https://shapeshed.com/vim-netrw/#nerdtree-like-setup
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
call plug#begin('~/.vim/plugged')  " Use Plug as plugin manager
Plug 'tpope/vim-commentary' "Handling commentary whatever the language
Plug 'dradtke/vim-dap' " Debug Adapter Protocol
Plug 'prabirshrestha/vim-lsp' " Language Server Protocol
Plug 'mattn/vim-lsp-settings' " Auto settings for LSP
Plug 'prabirshrestha/asyncomplete.vim' " Async autocompletion
Plug 'prabirshrestha/asyncomplete-lsp.vim' " Async LSP
Plug 'hrsh7th/vim-vsnip' " Add snippet
Plug 'hrsh7th/vim-vsnip-integ' " Snippet LSP integration
Plug 'rafamadriz/friendly-snippets' " Some preconfigured snippets
call plug#end()
" some vim windows switching shortcuts
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
"Leader t to toggle a terminal into vim
nnoremap <leader>t :below ter<CR>
"Tab completion
"Deactivate completion by default
let g:asyncomplete_auto_popup = 0 
" Use C-t to toggle/untoggle completion
inoremap <C-t> <esc>:let g:asyncomplete_auto_popup = !g:asyncomplete_auto_popup<CR>a
