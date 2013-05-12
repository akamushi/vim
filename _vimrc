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
" �N�����ɗL����
let g:neocomplcache_enable_at_startup = 1

let s:bundle = neobundle#get('neocomplcache')
function! s:bundle.hooks.on_source(bundle)
	" �⊮�E�B���h�E�̐ݒ�
	set completeopt=menuone
 
	" �啶�������͂����܂ő啶���������̋�ʂ𖳎�����
	let g:neocomplcache_enable_smart_case = 1
 
	" _(�A���_�[�X�R�A)��؂�̕⊮��L����
	let g:neocomplcache_enable_underbar_completion = 1
 
	let g:neocomplcache_enable_camel_case_completion  =  1
 
	" �|�b�v�A�b�v���j���[�ŕ\���������̐�
	let g:neocomplcache_max_list = 20
 
	" �V���^�b�N�X���L���b�V������Ƃ��̍ŏ�������
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

"�^�u��
set tabstop=2
"�^�u�̕ς��ɃX�y�[�X��}��
set expandtab
"shifttab�̐ݒ��L����
set smarttab
"�s����tab
set shiftwidth=2
"�I�[�g�C���f���g
set autoindent

"�N���b�v�{�[�h��windows�ƘA�g
set clipboard=unnamed
"�}�E�X����
set mouse=a

"�������Ƀ��[�v���Ȃ�
set nowrapscan
"�C���N�������^���T�[�`
set incsearch

"�܂�Ԃ��\�����Ȃ�
set nowrap
"�s�ԍ�
set number
"��\��������\��
set list
"���ꕶ���̌�������ݒ�
set listchars=tab:>-

" �w���v�͓��{��D��
set helplang=ja

" grep��vimgrep���g�p����
set grepprg=internal


" setfiletype
augroup filetypedetect
	autocmd! BufNewFile,BufRead *.scala setfiletype scala
augroup END



" vim: foldmethod=marker

