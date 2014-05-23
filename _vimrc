set nocompatible

" NeoBundle		"{{{

" required!
filetype off

if has('vim_starting')
  set runtimepath+=%USERPROFILE%\_vim\bundle/neobundle.vim
endif

call neobundle#begin(expand('~/_vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc'

"neocomplete {{{
NeoBundle 'Shougo/neocomplete'
" 起動時に有効化
let g:neocomplete#enable_at_startup = 1
" Use smartcase
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let s:bundle = neobundle#get('neocomplete')
function! s:bundle.hooks.on_source(bundle)
endfunction
" }}}


NeoBundle 'Shougo/unite.vim'		"{{{
let s:bundle = neobundle#get('unite.vim')
function! s:bundle.hooks.on_source(bundle)
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

endfunction
"}}}

NeoBundle 'sgur/unite-everything'
let s:bundle = neobundle#get('unite-everything')
function! s:bundle.hooks.on_source(bundle)
	let g:unite_source_everything_cmd_path = "D:/apps/everything/es.exe"
	" let g:unite_source_everything_limit = 10000
	" let g:unite_source_everything_full_path_search = 1
endfunction

NeoBundle 'Shougo/neomru.vim'

NeoBundle 'fuenor/qfixgrep'

NeoBundle 'vim-scripts/capslock.vim'
let s:bundle = neobundle#get('capslock.vim')
function! s:bundle.hooks.on_source(bundle)
	imap <C-a> <C-O><Plug>CapsLockToggle
endfunction

NeoBundle 'tyru/open-browser.vim'

NeoBundle 'thinca/vim-quickrun'

NeoBundle 'kannokanno/previm'
let s:bundle = neobundle#get('previm')
function! s:bundle.hooks.on_source(bundle)
	"let g:previm_open_cmd = "C:\\Program\ Files\\Internet Explorer\\iexplore.exe"
endfunction

NeoBundle 'vim-scripts/Align'
let s:bundle = neobundle#get('Align')
function! s:bundle.hooks.on_source(bundle)
	let g:Align_xstrlen = 3
endfunction


NeoBundle 'rhysd/accelerated-jk'
let s:bundle = neobundle#get('accelerated-jk')
function! s:bundle.hooks.on_source(bundle)
	" let g:accelerated_jk_acceleration_table = [50,20]
	let g:accelerated_jk_acceleration_limit = 250
	nmap j <Plug>(accelerated_jk_gj)
	nmap k <Plug>(accelerated_jk_gk)
endfunction

NeoBundle 'vim-scripts/JavaScript-Indent'

call neobundle#end()
"
" required
filetype plugin indent on

NeoBundleCheck

" }}}
syntax on

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

nnoremap <silent> <Esc><Esc> :<C-u>nohlsearch<CR>


" vim: foldmethod=marker

