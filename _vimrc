" Note: Skip initialization for vim-tiny or vim-small.
 if 0 | endif

 if has('vim_starting')
   if &compatible
     set nocompatible               " Be iMproved
   endif

   " Required:
   set runtimepath+=%USERPROFILE%\.vim\bundle\neobundle.vim\
 endif

 " Required:
 call neobundle#begin(expand('~/.vim/bundle/'))

 " Let NeoBundle manage NeoBundle
 " Required:
 NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/unite.vim'
NeoBundle 'sgur/unite-everything'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'fuenor/qfixgrep'
NeoBundle 'vim-scripts/capslock.vim'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'vim-scripts/Align'
NeoBundle 'rhysd/accelerated-jk'

 call neobundle#end()

 " Required:
 filetype plugin indent on

 " If there are uninstalled bundles found on startup,
 " this will conveniently prompt you to install them.
 NeoBundleCheck

"  Shougo/unite.vim "{{{
if neobundle#tap('unite.vim')
	" unite refix key.
	nnoremap [unite] <Nop>
	nmap f [unite]

	"unite general settings
	let g:unite_source_file_mru_limit = 50
	let g:unite_source_file_mru_filename_format = ''
	let g:unite_enable_start_insert = 1

	nnoremap <silent> [unite]f :<C-u>UniteWithCurrentDir -buffer-name=files file<CR>
	nnoremap <silent> [unite]b :<C-u>Unite buffer<CR>
	nnoremap <silent> [unite]c :<C-u>Unite bookmark<CR>
	nnoremap <silent> [unite]m :<C-u>Unite file_mru<CR>
	nnoremap <silent> [unite]e :<C-u>Unite everything/async<CR>
	nnoremap <silent> [unite]h :<C-u>Unite history/yank<CR>

	augroup vimrec
		autocmd FileType unite call s:unite_my_settings()
	augroup END
	function! s:unite_my_settings()
		nmap <buffer> <ESC> <Plug>(unite_exit)
	endfunction

endif
"}}}
" sgur/unite-everything "{{{
if neobundle#tap('unite-everything')
	let g:unite_source_everything_cmd_path = "D:/apps/everything/es.exe"
	" let g:unite_source_everything_limit = 10000
	" let g:unite_source_everything_full_path_search = 1
endif
"}}}
" vim-scripts/capslock.vim "{{{
if neobundle#tap('capslock.vim')
	imap <C-a> <C-O><Plug>CapsLockToggle
endif
"}}}
" vim-scripts/Align "{{{
if neobundle#tap('Align')
	let g:Align_xstrlen = 3
endif
"}}}
" rhysd/accelerated-jk "{{{
if neobundle#tap('accelerated-jk')
	" let g:accelerated_jk_acceleration_table = [50,20]
	let g:accelerated_jk_acceleration_limit = 250
	nmap j <Plug>(accelerated_jk_gj)
	nmap k <Plug>(accelerated_jk_gk)
endif
"}}}

" setfiletype
augroup filetypedetect
	autocmd BufNewFile,BufRead *.scala setfiletype scala
	autocmd BufNewFile,BufRead *.mkd setfiletype markdown
	autocmd BufNewFile,BufRead *.md setfiletype markdown
	autocmd BufNewFile,BufRead *.markdown setfiletype markdown
augroup END

"タブ幅
set tabstop=2
"タブの変わりにスペースを挿入
set expandtab
"shifttabの設定を有効化
set smarttab
"行頭のtab
set shiftwidth=2
"オートインデント
set autoindent

"クリップボードをwindowsと連携
set clipboard=unnamed
"マウス操作
set mouse=a

"検索時にループしない
set nowrapscan
"インクリメンタルサーチ
set incsearch

"折り返し表示しない
set nowrap
"行番号
set number
"非表示文字を表示
set list
"特殊文字の見え方を設定
set listchars=tab:>-

" ヘルプは日本語優先
set helplang=ja

" grepにvimgrepを使用する
set grepprg=internal

" ファイル名補完をbashのようにする
set wildmode=list:longest

" スムーズスクロール（笑）
map <C-U> <C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y>
map <C-D> <C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E>

" undoファイルの配置
set undodir=D:\tmp\\undodir

" Bash like KeyMaps {{{
nmap     <C-j> <CR>
imap     <C-j> <CR>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <C-a> <Home>
cnoremap <C-h> <Backspace>
cnoremap <C-d> <Del>
cnoremap <C-e> <End>

nnoremap <silent> tt :<C-u>tabe<CR>
nnoremap <C-p> gT
nnoremap <C-n> gt

" nnoremap <Esc><Esc> :<C-u>nohlsearch<CR>


" vim: foldmethod=marker

