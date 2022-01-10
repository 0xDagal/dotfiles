" Using packager as my plugin manager following the Vim 8 way of managing
" plugins with pack
function! s:packager_init(packager) abort
  call a:packager.add('kristijanhusak/vim-packager', { 'type': 'opt' })
  call a:packager.add('prabirshrestha/vim-lsp', { 'type': 'start' })
  call a:packager.add('mattn/vim-lsp-settings', { 'type': 'start' })
  call a:packager.add('prabirshrestha/asyncomplete-lsp.vim', { 'type': 'start' })
  call a:packager.add('prabirshrestha/asyncomplete.vim', { 'type': 'start' })
  call a:packager.add('hrsh7th/vim-vsnip', { 'type': 'start' })
  call a:packager.add('hrsh7th/vim-vsnip-integ', { 'type': 'start' })
  call a:packager.add('rafamadriz/friendly-snippets', { 'type': 'start' })
  call a:packager.add('tpope/vim-commentary', { 'type': 'start' })
  call a:packager.add('dylanaraps/wal.vim', { 'type': 'start' })
  call a:packager.add('kovetskiy/sxhkd-vim', { 'type': 'start' })
  call a:packager.add('puremourning/vimspector', { 'type': 'start' })
endfunction
packadd vim-packager
call packager#setup(function('s:packager_init'))
" colorscheme wal

" LSP config
" Deactivate completion by default
let g:asyncomplete_auto_popup = 0
" Deactivate highlight references
let g:lsp_document_highlight_enabled = 1
" Use C-t to toggle/untoggle completion
inoremap <C-t> <esc>:let g:asyncomplete_auto_popup = !g:asyncomplete_auto_popup<CR>a
nnoremap <leader>gd :LspDefinition<CR>
nnoremap <leader>gh :LspHover<CR>
" LSP folding
set foldmethod=expr
  \ foldexpr=lsp#ui#vim#folding#foldexpr()
  \ foldtext=lsp#ui#vim#folding#foldtext()

" Use Visual Studio Mapping to debug with VimSpector
let g:vimspector_enable_mappings = 'VISUAL_STUDIO'
" Deactivate completion by default
let g:asyncomplete_auto_popup = 0 
" Deactivate highlight references
let g:lsp_document_highlight_enabled = 0
" Use C-t to toggle/untoggle completion
inoremap <C-t> <esc>:let g:asyncomplete_auto_popup = !g:asyncomplete_auto_popup<CR>a

" VimSpector config
