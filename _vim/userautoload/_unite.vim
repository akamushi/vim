" Unite
" unite���J���Ă���Ԃ̃L�[�}�b�s���O
augroup vimrc
  autocmd FileType unite call s:unite_my_settings()
augroup END
function! s:unite_my_settings()
  "ESC��unite���I��
  nmap <buffer> <ESC> <Plug>(unite_exit)
endfunction






