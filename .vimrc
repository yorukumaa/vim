filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

"Vundle call plugins
Bundle 'gmarik/vundle'

"github plugins
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'rstacruz/sparkup', {'rcp': 'vim/'}

"www.vim.org plugins
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'rails.vim'
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/unite.vim'
Bundle 'kana/vim-smartchr'
Bundle 'taku-o/vim-toggle'
Bundle 'Shougo/vimproc'
Bundle 'tomtom/tcomment_vim'
"Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'Shougo/vimshell'

"other git plugin
Bundle 'git://git.wincent.com/command-t.git'

filetype plugin indent on

"
" Unite
"
" インサート／ノーマルどちらからでも呼び出せるようにキーマップ
let g:unite_enable_start_insert = 1
nnoremap <silent> <C-f> :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
inoremap <silent> <C-f> <ESC>:<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> <C-b> :<C-u>Unite buffer file_mru<CR>
inoremap <silent> <C-b> <ESC>:<C-u>Unite buffer file_mru<CR>

" バッファ一覧
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
" ファイル一覧
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" レジスタ一覧
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
" 最近使用したファイル一覧
nnoremap <silent> ,um :<C-u>Unite file_mru<CR>
" 全部乗せ
nnoremap <silent> ,ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>

" unite.vim上でのキーマッピング
autocmd FileType unite call s:unite_my_settings()

function! s:unite_my_settings()
" 単語単位からパス単位で削除するように変更
imap <buffer> <C-w> <Plug>(unite_delete_backward_path)
" ESCキーを2回押すと終了する
nmap <silent><buffer> <ESC><ESC> q
imap <silent><buffer> <ESC><ESC> <ESC>q
endfunction

set encoding=utf-8
set fenc=utf-8

"
"Complcache
"
au BufRead,BufNew * match JpSpace /　/
highlight JpSpace cterm = underline ctermfg = Blue guifg = Blue
highlight Todo term=reverse cterm=bold ctermfg=3 ctermbg=2 gui=reverse guifg=slategrey guibg=khaki
highlight WildMenu term=reverse cterm=bold ctermfg=3 ctermbg=2 gui=reverse guifg=slategrey guibg=khaki

"----------------------------------------------------
" インデント
"----------------------------------------------------
" オートインデントを無効にする
"set noautoindent
" タブが対応する空白の数
set tabstop=4
" タブやバックスペースの使用等の編集操作をするときに、タブが対応する空白の数
set softtabstop=4

" インデントの各段階に使われる空白の数
set shiftwidth=4
" タブを挿入するとき、代わりに空白を使わない
set noexpandtab

"----------------------------------------------------
" 表示関係
"----------------------------------------------------
" タイトルをウインドウ枠に表示する
set title
" 行番号を表示しない
set number
" ルーラーを表示
set ruler
" タブ文字を CTRL-I で表示し、行末に $ で表示する
"set list
" 入力中のコマンドをステータスに表示する

set showcmd
" ステータスラインを常に表示
set laststatus=2
" 括弧入力時の対応する括弧を表示
set showmatch
" 対応する括弧の表示時間を2にする
set matchtime=2
" シンタックスハイライトを有効にする
syntax on

" 検索結果文字列のハイライトを有効にする
set hlsearch
" コメント文の色を変更
" highlight Comment ctermfg=DarkCyan
" コマンドライン補完を拡張モードにする
set wildmenu
" setnum
set cursorline

" ctag-list
"set tags=/home/

" uplow
" set ignorecase
set smartcase

" incsearch
set incsearch

" nomodeline
set nomodeline
set modelines=0

" neocomplcache
let g:neocomplcache_enable_at_startup = 1


""
" PHP Lint
nmap ,l :call PHPLint<CR>

color desert
" Color
" Solarized
syntax enable
highlight Comment ctermfg=DarkCyan
highlight Folded term=underline ctermfg=1 guifg=Magenta
highlight Pmenu ctermfg=darkred ctermbg=2 guibg=LightMagenta
highlight PmenuSel ctermfg=yellow ctermbg=3 guibg=Grey

"
" @author halt feits <halt.feits at gmail.com>
"
function PHPLint()
let result = system( &ft . ' -l ' . bufname(""))
echo result
endfunction
