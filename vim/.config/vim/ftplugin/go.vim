" LSP configurations for vim-lsp
if executable('gopls')
    autocmd User lsp_setup call lsp#register_server({
        \   'name': 'gopls',
        \   'cmd': ['gopls'],
        \   'allowlist': ['go', 'gomod'],
        \ })
endif

" Set lsp linter
let g:ale_linters = { 'go': ['staticcheck'] }

" DAP settings

let g:vimspector_install_gadgets += [ 'delve' ]
