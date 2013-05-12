set nocompatible

" NeoBundle		"{{{

" required!
filetype off

if has('vim_starting')
  set runtimepath+=%USERPROFILE%\_vim\bundle/neobundle.vim
endif

call neobundle#rc(expand('~\_vim\bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc'

"neocomplcache {{{
NeoBundle 'Shougo/neocomplcache'
" 起動時に有効化
let g:neocomplcache_enable_at_startup = 1

let s:bundle = neobundle#get('neocomplcache')
function! s:bundle.hooks.on_source(bundle)
	" 補完ウィンドウの設定
	set completeopt=menuone
 
	" 大文字が入力されるまで大文字小文字の区別を無視する
	let g:neocomplcache_enable_smart_case = 1
 
	" _(アンダースコア)区切りの補完を有効化
	let g:neocomplcache_enable_underbar_completion = 1
 
	let g:neocomplcache_enable_camel_case_completion  =  1
 
	" ポップアップメニューで表示される候補の数
	let g:neocomplcache_max_list = 20
 
	" シンタックスをキャッシュするときの最小文字長
	let g:neocomplcache_min_syntax_length = 3

endfunction
" }}}

NeoBundle 'Shougo/neosnippet'		"{{{
let s:bundle = neobundle#get('neosnippet')
function! s:bundle.hooks.on_source(bundle)
	imap <C-k>	<Plug>(neosnippet_expand_or_jump)
	smap <C-k>	<Plug>(neosnippet_expand_or_jump)

	let g:neosnippet#snippets_directory='~/_vim/vim-snippets/snippets'

endfunction
"}}}


" vimshell {{{
NeoBundleLazy 'Shougo/vimshell', {
\	'autoload' : {
\		'commands' : ['VimShell']
\	},
\}
"}}}

NeoBundle 'sgur/unite-everything'

NeoBundle 'ujihisa/unite-colorscheme'

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
	nnoremap <silent> [unite]e :<C-u>Unite everything<CR>

	augroup vimrec
		autocmd FileType unite call s:unite_my_settings()
	augroup END
	function! s:unite_my_settings()
		nmap <buffer> <ESC> <Plug>(unite_exit)
	endfunction

endfunction
"}}}

" vimfiler {{{
NeoBundleLazy 'Shougo/vimfiler', {
\	'autoload' : {
\		'commands' : ['VimFilerBufferDir', 'VimFilerCreate', 'VimFiler', 'VimFilerExplorer' ]
\	},
\	'depends' : ['Shougo/unite.vim'],
\}
" }}}

NeoBundle 'ujihisa/quickrun'		"{{{
let s:bundle = neobundle#get('quickrun')
function! s:bundle.hooks.on_source(bundle)
	let g:quickrun_config = {
	\  '_': {
	\    'runmode': 'async:vimproc:10',
	\    'hook/output_encode/enable': 1,
	\  },
	\}

endfunction
"}}}

NeoBundle 'fuenor/qfixgrep'

" Required!
filetype plugin indent on


" }}}
syntax on

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


" setfiletype
augroup filetypedetect
	autocmd! BufNewFile,BufRead *.scala setfiletype scala
augroup END



" vim: foldmethod=marker

