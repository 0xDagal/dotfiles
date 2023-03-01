if executable('xclip')
    " Copy to clipboard
    vmap <C-y> :w !xclip -sel clip<CR><CR>
    nmap <C-y> :.w !xclip -sel clip<CR><CR>
    nmap <C-p> :r !xclip -o -sel clip<CR><CR>
endif
