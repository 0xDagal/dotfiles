syntax on "Activate syntax
set noerrorbells
set tabstop=2 "How many spaces when a tab is pressed
set softtabstop=2 "How many spaces to add at the 
set shiftwidth=2 "How many spaces when you indent something
" set nosc
set expandtab "Insert spaces as tab is pressed
set smartindent
" Hybrid number
set number relativenumber
" No relativenumber in INSERT Mode
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END
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
" No F1 help
nmap <F1> <nop>
" Copy to clipboard
vmap <C-c> :!xclip -f -sel clip<CR>
call plug#begin('~/.vim/plugged') 
" Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'neoclide/coc.nvim', {'branch': 'release'} " CoC for Completion
Plug 'mbbill/undotree' "Simple Undotree (yes that's the name of it)
Plug 'preservim/nerdtree' "File tree
Plug 'itchyny/lightline.vim' "The lightline at the bottom
Plug 'tpope/vim-commentary' "Handling commentary whatever the lang
call plug#end()
" Lightline
set laststatus=2
set noshowmode
" leaderkey mapped to space
let mapleader = " "
" use <tab> for trigger completion and navigate to the next complete item
" in CoC
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction
inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
" F5 to Toggle Undotree
nnoremap <F5> :UndotreeToggle<cr>
" some CoC shortcuts
nnoremap <leader>m :CocList marketplace<CR> " Open CoC marketplace
" some vim windows switching shortcuts
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
" allow to scroll in the preview
set mouse=a
" Open NERDTree
nnoremap <leader>p :NERDTreeToggle<CR> 
"If no file specified then nvim opens with NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"Leader T to toggle a terminal into vim
nnoremap <leader>t :below ter<CR> "Open a terminal below
