" Unite
" unite prefix key.
nnoremap nnoremap [unite] <Nop>
nmap <Space>f [unite]

"unite general settings
let g:unite_source_file_mru_limit = 50
let g:unite_source_file_mru_filename_format = ''

nnoremap <silent> [unite]f :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> [unite]b :<C-u>Unite buffer<CR>
nnoremap <silent> [unite]c :<C-u>Unite bookmark<CR>

augroup vimrc
  autocmd FileType unite call s:unite_my_settings()
augroup END
function! s:unite_my_settings()
  nmap <buffer> <ESC> <Plug>(unite_exit)
endfunction





