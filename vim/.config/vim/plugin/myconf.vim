" Using packager as my plugin manager following the Vim 8 way of managing

function! s:packager_init(packager) abort
  call a:packager.add('kristijanhusak/vim-packager', { 'type': 'opt' })
  "call a:packager.add('jayli/vim-easycomplete', { 'type': 'start' })
  "call a:packager.add('SirVer/ultisnips', { 'type': 'start' })
   call a:packager.add('prabirshrestha/vim-lsp', { 'type': 'start' })
   call a:packager.add('mattn/vim-lsp-settings', { 'type': 'start' })
   call a:packager.add('prabirshrestha/asyncomplete-lsp.vim', { 'type': 'start' })
   call a:packager.add('prabirshrestha/asyncomplete.vim', { 'type': 'start' })
   call a:packager.add('hrsh7th/vim-vsnip', { 'type': 'start' })
   call a:packager.add('hrsh7th/vim-vsnip-integ', { 'type': 'start' })
   call a:packager.add('rafamadriz/friendly-snippets', { 'type': 'start' })
   call a:packager.add('fatih/vim-go', { 'type': 'start' })
endfunction
packadd vim-packager
call packager#setup(function('s:packager_init'))
" Easy complete config
"let g:easycomplete_tab_trigger="<c-n>"
" LSP config
" Deactivate completion by default
 let g:asyncomplete_auto_popup = 0
" Deactivate highlight references
 let g:lsp_document_highlight_enabled = 0
" Use C-t to toggle/untoggle completion
 inoremap <C-t> <esc>:let g:asyncomplete_auto_popup = !g:asyncomplete_auto_popup<CR>a
 nnoremap <leader>gd :LspDefinition<CR>
 nnoremap <leader>gh :LspHover<CR>
" Debugging

" Termdebug settings
packadd termdebug
let g:termdebug_wide=1 " debuggers pane one the left side
