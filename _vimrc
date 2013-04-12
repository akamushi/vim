set nocompatible

filetype off

if has('vim_starting')
  set runtimepath+=%USERPROFILE%\_vim\bundle/neobundle.vim
  call neobundle#rc(expand('~\_vim\bundle/'))
endif

NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'fuenor/qfixgrep'


filetype plugin indent on     " Required!


set runtimepath+=%USERPROFILE%\_vim\
" 分割した設定ファイルを読み込む
runtime! userautoload/*.vim
