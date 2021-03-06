" vim:set ts=8 sts=2 sw=2 tw=0: (この行に関しては:help modelineを参照)

syntax on

"---------------------------------------------------------------------------
" 検索の挙動に関する設定:
"
" 検索時に大文字小文字を無視 (noignorecase:無視しない)
set ignorecase
" 大文字小文字の両方が含まれている場合は大文字小文字を区別
set smartcase

" 今いる場所をカレントdirとする
set autochdir

" clipboardを共有する
set clipboard+=unnamed

"---------------------------------------------------------------------------
" 編集に関する設定:
"cindentやautoindent時に挿入されるタブの幅（tabstop と揃えておくと良い）
set shiftwidth=4
" タブの画面上での幅
set tabstop=4
" タブをスペースに展開しない (expandtab:展開する)
set expandtab
" 自動的にインデントする (noautoindent:インデントしない)
set autoindent
" バックスペースでインデントや改行を削除できるようにする
set backspace=2
" 検索時にファイルの最後まで行ったら最初に戻る (nowrapscan:戻らない)
set wrapscan
" 括弧入力時に対応する括弧を表示 (noshowmatch:表示しない)
set showmatch
" コマンドライン補完するときに強化されたものを使う(参照 :help wildmenu)
set wildmenu
" テキスト挿入中の自動折り返しを日本語に対応させる
set formatoptions+=mM
" 日本語整形スクリプト(by. 西岡拓洋さん)用の設定
let format_allow_over_tw = 1	" ぶら下り可能幅

"---------------------------------------------------------------------------
" GUI固有ではない画面表示の設定:
"
" 行番号を非表示 (number:表示)
set number
" ルーラーを表示 (noruler:非表示)
set ruler
" タブや改行を表示 (list:表示)
set nolist
" どの文字でタブや改行を表示するかを設定
"set listchars=tab:>-,extends:<,trail:-,eol:\  
" 長い行を折り返して表示 (nowrap:折り返さない)
set nowrap
" 常にステータス行を表示 (詳細は:he laststatus)
set laststatus=2
" コマンドラインの高さ (Windows用gvim使用時はgvimrcを編集すること)
set cmdheight=2
" コマンドをステータス行に表示
set showcmd
" タイトルを表示
set title
" 画面を黒地に白にする (次行の先頭の " を削除すれば有効になる)
colorscheme ap_dark8
 "==================================================================
" ステータスライン コマンドライン
"==================================================================

" 常にステータス行を表示 (詳細は:he laststatus)
set laststatus=2
" ステータスラインに文字コードと改行文字を表示する
set statusline=%<[%n]%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']['.&ft.']'}\ %F%=%l,%c%V%8P

" コマンドラインの高さ
set cmdheight=2
" コマンドをステータス行に表示
set showcmd
" コマンドライン補完するときに強化されたものを使う(参照 :help wildmenu)
set wildmenu
set wildmode=list:longest
set formatoptions+=mM

" タイトルを表示
set title

"inoremap <expr> <CR> pumvisible() ? \<C-Y>\<CR>" : "\<CR>"
"---------------------------------------------------------------------------
" ファイル操作に関する設定:
"
" バックアップファイルを作成しない (次行の先頭の " を削除すれば有効になる)
set nobackup
set noswapfile

"---------------------------------------------------------------------------
""行末の不要なスペース削除 & タブをスペースに
"
function! RTrim()
let s:cursor = getpos(".")
%s/\s\+$//e
call setpos(".", s:cursor)
endfunction
autocmd BufWritePre *.php,*.rb,*.js,*.bat call RTrim()
"
""---------------------------------------------------------------------------
" (),[],{},<>,””,’’,“入力+()の中にカーソル戻す
imap {} {}<Left>
imap [] []<Left>
imap () ()<Left>
imap "" ""<Left>
imap '' ''<Left>
imap <> <><Left>


" 言語
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,iso-2022-jp,euc-jp,cp932
set fileformat=unix
set fileformats=unix,dos
set ambiwidth=double

" shot cut
map ge :tabedit .<CR>
map gw :tabclose<CR>
map gp :tabprev<CR>
map tt :tabnew

" mac cron
set backupskip=/tmp/*,/private/tmp/*


" tagsジャンプの時に複数ある時は一覧表示                                        
nnoremap <C-]> g<C-]> 

" vim-pathogen
" pathogenでftdetectなどをloadさせるために一度ファイルタイプ判定をoff
filetype off
" pathogen.vimによってbundle配下のpluginをpathに加える
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
set helpfile=$VIMRUNTIME/doc/help.txt
" ファイルタイプ判定をon
filetype plugin on

"==================================================================
"" Plugin
"==================================================================
"
"------------------------------------
" neocomplcache
"------------------------------------
let g:neocomplcache_enable_at_startup = 1 " 起動時に有効化
"大文字小文字を区別する
let g:neocomplcache_smartcase = 1
"キャメルケース補完を有効にする
let g:neocomplcache_enablecamelcasecompletion = 1
"アンダーバー補完を有効にする
let g:neocomplcache_enableunderbarcompletion = 1
"シンタックスファイルの補完対象キーワードとする最小の長さ
let g:neocomplcache_minsyntaxlength = 3
"プラグイン毎の補完関数を呼び出す文字数
let g:neocomplcache_plugincompletionlength = {
  \ 'keyword_complete'  : 2,
  \ 'syntax_complete'   : 2
  \ }
"ファイルタイプ毎の辞書ファイルの場所
let g:neocomplcache_dictionaryfiletypelists = {
            \ 'default' : '',
            \ 'php' : $VIM.'/dict/PHP.dict',
            \ 'tpl' : $VIM.'/dict/smarty.dict',
            \ }

"------------------------------------
" PDV (phpDocumentor for Vim) 
"------------------------------------
"
inoremap <C-X> <ESC>:call PhpDocSingle()<CR>i 
nnoremap <C-X> :call PhpDocSingle()<CR> 
vnoremap <C-X> :call PhpDocRange()<CR> 

"-------------------
" Vim-php-cs-fixer
"-------------------
"

let g:php_cs_fixer_path = "~/dotfiles/php-cs-fixer" " define the path to the php-cs-fixer.phar
let g:php_cs_fixer_level = "all"                " which level ?
let g:php_cs_fixer_config = "default"           " configuration
let g:php_cs_fixer_php_path = "php"             " Path to PHP
let g:php_cs_fixer_fixers_list = ""             " List of fixers
let g:php_cs_fixer_enable_default_mapping = 1   " Enable the mapping by default (<leader>pcd)
let g:php_cs_fixer_dry_run = 0                  " Call command with dry-run option
let g:php_cs_fixer_verbose = 0                  " Return the output of command if 1, else an inline information.


nnoremap <silent><leader>pcd :call PhpCsFixerFixDirectory()<CR>
nnoremap <silent><leader>pcf :call PhpCsFixerFixFile()<CR>

"
" 拡張子でインデントを変更する
au BufNewFile,BufRead *.html set nowrap tabstop=2 shiftwidth=2
au BufNewFile,BufRead *.tpl set nowrap tabstop=2 shiftwidth=2
au BufNewFile,BufRead *.php set nowrap tabstop=4 shiftwidth=4

let g:php_noShortTags=1
let g:php_asp_tags=1
let php_sql_query=1
let php_htmlInStrings=1

"-----------------
" syntastic
"
"
"let g:syntastic_php_checkers=['php', 'phpmd']
let g:syntastic_php_checkers=['php']

if has('path_extra')
    set tags+=tags;
endif
