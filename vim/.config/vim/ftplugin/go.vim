function! s:packager_init(packager) abort
    call a:packager.add('fatih/vim-go', { 'type': 'start' }) " Combine bo
endfunction
packadd vim-packager
call packager#setup(function('s:packager_init'))
PackagerInstall

" LSP configurations for vim-lsp
if executable('gopls')
    autocmd User lsp_setup call lsp#register_server({
        \   'name': 'gopls',
        \   'cmd': ['gopls'],
        \   'allowlist': ['go', 'gomod'],
        \ })
endif

" Set 'vim-lsp' linter
let g:ale_linters = { 'go': ['staticcheck'] }

" Set MUComplete chain
" let g:mucomplete#chains = {
"     \ 'go' : ['omni
