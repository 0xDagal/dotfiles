" Using packager as my plugin manager following the Vim 8 way of managing
function! s:packager_init(packager) abort
    call a:packager.add('kristijanhusak/vim-packager', { 'type': 'opt' }) " Package manager
    call a:packager.add('morhetz/gruvbox', { 'type': 'start' }) " Colorscheme
    call a:packager.add('prabirshrestha/vim-lsp', { 'type': 'start' }) " LSP Client
    call a:packager.add('mattn/vim-lsp-settings', { 'type': 'start' }) " Manage LSP Client settings
    call a:packager.add('dense-analysis/ale', { 'type': 'start' }) " LSP Client for linting
    call a:packager.add('rhysd/vim-lsp-ale', { 'type': 'start' }) " Combine both
endfunction
packadd vim-packager
call packager#setup(function('s:packager_init'))

" Colorscheme
colorscheme gruvbox
set background=dark

" File type plugin
filetype plugin indent on

" LSP Settings
setlocal omnifunc=lsp#complete
setlocal signcolumn=yes
let g:ale_change_sign_column_color = 1
let g:ale_lint_on_save = 1
" Use C-t to toggle/untoggle completion
nnoremap <leader>gd :LspDefinition<CR>
nnoremap <leader>gh :LspHover<CR>

" Debugging
" Termdebug settings
packadd termdebug
let g:termdebug_wide=1 " debuggers pane one the left side
