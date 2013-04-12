" Unite
" uniteを開いている間のキーマッピング
augroup vimrc
  autocmd FileType unite call s:unite_my_settings()
augroup END
function! s:unite_my_settings()
  "ESCでuniteを終了
  nmap <buffer> <ESC> <Plug>(unite_exit)
endfunction






