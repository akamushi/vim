if &compatible
  set nocompatible
endif
function! s:source_rc(path, ...) abort "{{{
  let use_global = get(a:000, 0, !has('vim_starting'))
  let abspath = resolve(expand('~/vimfiles/rc/' . a:path))
  if !use_global
    execute 'source' fnameescape(abspath)
    return
  endif

  " substitute all 'set' to 'setglobal'
  let content = map(readfile(abspath),
        \ 'substitute(v:val, "^\\W*\\zsset\\ze\\W", "setglobal", "")')
  " create tempfile and source the tempfile
  let tempfile = tempname()
  try
    call writefile(content, tempfile)
    execute printf('source %s', fnameescape(tempfile))
  finally
    if filereadable(tempfile)
      call delete(tempfile)
    endif
  endtry
endfunction"}}}


set runtimepath+=~/vimfiles/plugins

" Set augroup.
augroup MyAutoCmd
  autocmd!
augroup END

if has('vim_starting')
  call s:source_rc('init.rc.vim')
endif

call s:source_rc('dein.rc.vim')

if !has('vim_starting')
  call dein#call_hook('source')
  call dein#call_hook('post_source')

  syntax enable
  filetype plugin indent on
endif

call s:source_rc('search.rc.vim')
call s:source_rc('edit.rc.vim')
call s:source_rc('view.rc.vim')
call s:source_rc('gui.rc.vim')

autocmd MyAutoCmd FileType,Syntax,BufNewFile,BufNew,BufRead
      \ * call s:my_on_filetype()
function! s:my_on_filetype() abort 
  if &l:filetype == '' && bufname('%') == ''
    return
  endif

  redir => filetype_out
  silent! filetype
  redir END
  if filetype_out =~# 'OFF'
    " Lazy loading
    silent! filetype plugin indent on
    syntax enable
    filetype detect
  endif
endfunction 
call s:my_on_filetype()

