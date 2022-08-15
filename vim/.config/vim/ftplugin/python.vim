" LSP configurations for vim-lsp
if executable('pyls')
    autocmd User lsp_setup call lsp#register_server({
        \   'name': 'pyls',
        \   'cmd': ['pyls'],
        \   'allowlist': ['python'],
        \ })
endif

" Set lsp linter
let g:ale_linters = { 'python': ['pylama'] }

" DAP settings
let g:vimspector_install_gadgets += [ 'debugpy' ]

let g:vimspector_configurations = {
            \  "python": {
            \    "adapter": "debugpy",
            \    "configuration": {
            \      "request": "launch",
            \      "stopOnEntry": v:true,
            \      "cwd": "${workspaceRoot}"
            \    }
            \  }
            \}
