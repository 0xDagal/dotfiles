" Using packager as my plugin manager following the Vim 8 way of managing

function! s:packager_init(packager) abort
  call a:packager.add('kristijanhusak/vim-packager', { 'type': 'opt' })
  call a:packager.add('prabirshrestha/vim-lsp', { 'type': 'start' })
  call a:packager.add('mattn/vim-lsp-settings', { 'type': 'start' })
  call a:packager.add('prabirshrestha/asyncomplete-lsp.vim', { 'type': 'start' })
  call a:packager.add('prabirshrestha/asyncomplete.vim', { 'type': 'start' })
  call a:packager.add('hrsh7th/vim-vsnip', { 'type': 'start' })
  call a:packager.add('hrsh7th/vim-vsnip-integ', { 'type': 'start' })
  call a:packager.add('rafamadriz/friendly-snippets', { 'type': 'start' })
  call a:packager.add('suy/vim-context-commentstring', { 'type': 'start' })
  call a:packager.add('tpope/vim-commentary', { 'type': 'start' })
"  call a:packager.add('christoomey/vim-tmux-navigator', { 'type': 'start' })
endfunction
packadd vim-packager
call packager#setup(function('s:packager_init'))

" LSP config
" Deactivate completion by default
let g:asyncomplete_auto_popup = 0
" Deactivate highlight references
let g:lsp_document_highlight_enabled = 0
" Use C-t to toggle/untoggle completion
inoremap <C-t> <esc>:let g:asyncomplete_auto_popup = !g:asyncomplete_auto_popup<CR>a
nnoremap <leader>gd :LspDefinition<CR>
nnoremap <leader>gh :LspHover<CR>
" LSP folding
set foldmethod=expr
  \ foldexpr=lsp#ui#vim#folding#foldexpr()
  \ foldtext=lsp#ui#vim#folding#foldtext()

" Debugging

" Termdebug settings
packadd termdebug " at first use it
let g:termdebug_wide=1 " debuggers pane one the left side

" For C/CPP programming
autocmd FileType c let g:termdebugger = "gdb"
autocmd FileType cpp let g:termdebugger = "gdb"
" Compile with debug information to same file without .c and then run the
" debugger
autocmd FileType c nnoremap <leader>c :!gcc -g %:t -o %:t:r<CR>:Termdebug %:t:r<CR>
autocmd FileType cpp nnoremap <leader>c :!gcc -g %:t -o %:t:r<CR>:Termdebug %:t:r<CR>

" Python WIP
autocmd FileType python let g:termdebugger = ['python', '-m', 'pdb']
autocmd FileType python nnoremap <leader>c :Termdebug %:t<CR>

" Go WIP
autocmd FileType go let g:termdebugger = ['dlv', 'debug']
autocmd FileType go nnoremap <leader>c :Termdebug %:t<CR>
