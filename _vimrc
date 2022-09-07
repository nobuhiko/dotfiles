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
"set clipboard=unnamed,autoselect

" un~を無効にする
set noundofile

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

" クリップボードにコピー
if has('mac')
    set clipboard+=unnamed
elseif has('unix')
    set clipboard=unnamedplus
endif


" 画面を黒地に白にする (次行の先頭の " を削除すれば有効になる)
"colorscheme ap_dark8

"set background=dark
"colorscheme gruvbox
 "==================================================================
" ステータスライン コマンドライン
"==================================================================

" 常にステータス行を表示 (詳細は:he laststatus)
"set laststatus=2
" ステータスラインに文字コードと改行文字を表示する
"set statusline=%<[%n]%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']['.&ft.']'}\ %F%=%l,%c%V%8P

" コマンドラインの高さ
set cmdheight=2
" コマンドをステータス行に表示
set showcmd
" コマンドライン補完するときに強化されたものを使う(参照 :help wildmenu)
"set wildmenu
"set wildmode=list:longest
"set formatoptions+=mM

" タイトルを表示
"set title

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

if !&compatible
  set nocompatible
endif

" reset augroup
augroup MyAutoCmd
  autocmd!
augroup END

" dein setting {{{
" プラグインが実際にインストールされるディレクトリ
let s:dein_dir_ = '~/.config/dein'
let s:dein_dir = expand(s:dein_dir_)

let s:dein_repo_dir = expand(s:dein_dir_ . '/repos/github.com/Shougo/dein.vim')

if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif

  execute 'set runtimepath^=' . s:dein_repo_dir
endif

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " 補完系
  call dein#add('Shougo/dein.vim')
  call dein#add('haya14busa/dein-command.vim')
  call dein#add('prabirshrestha/vim-lsp')
  call dein#add('mattn/vim-lsp-settings')
  call dein#add('prabirshrestha/asyncomplete.vim', {'merged': 0})
  call dein#add('prabirshrestha/asyncomplete-lsp.vim', {'merged': 0})
  call dein#add('prabirshrestha/asyncomplete-buffer.vim')
  call dein#add('hrsh7th/vim-vsnip')
  call dein#add('hrsh7th/vim-vsnip-integ')
  call dein#add('kitagry/vs-snippets')
  call dein#add('kitagry/asyncomplete-tabnine.vim')
  call dein#add('prabirshrestha/async.vim')



  " Git系
  call dein#add('tpope/vim-fugitive')

  call dein#add('plasticboy/vim-markdown')
  call dein#add('Shougo/context_filetype.vim')

  call dein#add('vim-airline/vim-airline')
  
  call dein#add('phpactor/phpactor', { 'on_ft' : ['php'], 'build': ['composer install'] })
  call dein#add('scrooloose/syntastic')


  call dein#add('Shougo/ddc.vim')
  call dein#add('vim-denops/denops.vim')
  call dein#add('Shougo/ddc-around')
  call dein#add('Shougo/ddc-matcher_head')
  call dein#add('Shougo/ddc-sorter_rank')


  call dein#end()
  call dein#save_state()
endif

" もし、未インストールものものがあったらインストール
augroup PluginInstall
  autocmd!
  autocmd VimEnter * if dein#check_install() | call dein#install() | endif
augroup END
" }}}

" $VIMRUNTIME/syntax/php.vim
let g:php_baselib       = 1
let g:php_htmlInStrings = 1
let g:php_noShortTags   = 1
let g:php_sql_query     = 1

" colorschemeの設定前に書くこと
autocmd ColorScheme * highlight LineNr ctermfg=247
set background=dark
colorscheme janah



" 画面を分割して定義元へのジャンプ
function! DefinitionJumpWithPhpactor()
    split
    call phpactor#GotoDefinition()
endfunction


" useの補完
nmap <silent><Leader>u      :<C-u>call phpactor#UseAdd()<CR>
" コンテキストメニューの起動(カーソル下のクラスやメンバに対して実行可能な選択肢を表示してくれます)
nmap <silent><Leader>mm     :<C-u>call phpactor#ContextMenu()<CR>
" ナビゲーションメニューの起動(クラスの参照元を列挙したり、他ファイルへのジャンプなど)
nmap <silent><Leader>nn     :<C-u>call phpactor#Navigate()<CR>
" カーソル下のクラスやメンバの定義元にジャンプ
nmap <silent><Leader>o      :<C-u>call phpactor#GotoDefinition()<CR>
" 編集中のクラスに対し各種の変更を加える(コンストラクタ補完、インタフェース実装など)
nmap <silent><Leader>tt     :<C-u>call phpactor#Transform()<CR>
" 新しいクラスを生成する(編集中のファイルに)
nmap <silent><Leader>cc     :<C-u>call phpactor#ClassNew()<CR>
" 選択した範囲を変数に抽出する
nmap <silent><Leader>ee     :<C-u>call phpactor#ExtractExpression(v:false)<CR>
" 選択した範囲を変数に抽出する
vmap <silent><Leader>ee     :<C-u>call phpactor#ExtractExpression(v:true)<CR>
" 選択した範囲を新たなメソッドとして抽出する
vmap <silent><Leader>em     :<C-u>call phpactor#ExtractMethod()<CR>
" split → jump
nmap <silent><C-w><Leader>o :<C-u>call DefinitionJumpWithPhpactor()<CR>
" カーソル下のクラスや変数の情報を表示する
" 他のエディタで、マウスカーソルをおいたときに表示されるポップアップなどに相当
vmap <silent><Leader>hh     :<C-u>call phpactor#Hover()<CR>

" tagsジャンプの時に複数ある時は一覧表示
nnoremap <C-]> g<C-]>

" 拡張子でインデントを変更する
au BufNewFile,BufRead *.html set nowrap tabstop=2 shiftwidth=2
au BufNewFile,BufRead *.tpl set nowrap tabstop=4 shiftwidth=4
au BufNewFile,BufRead *.php set nowrap tabstop=4 shiftwidth=4

if has('path_extra')
    set tags+=tags;
endif

" syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_php_checkers = ['php']
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


" Customize global settings
" Use around source.
" https://github.com/Shougo/ddc-around
call ddc#custom#patch_global('sources', ['around'])

" Use matcher_head and sorter_rank.
" https://github.com/Shougo/ddc-matcher_head
" https://github.com/Shougo/ddc-sorter_rank
call ddc#custom#patch_global('sourceOptions', {
      \ '_': {
      \   'matchers': ['matcher_head'],
      \   'sorters': ['sorter_rank']},
      \ })

" Change source options
call ddc#custom#patch_global('sourceOptions', {
      \ 'around': {'mark': 'A'},
      \ })
call ddc#custom#patch_global('sourceParams', {
      \ 'around': {'maxSize': 500},
      \ })

" Customize settings on a filetype
call ddc#custom#patch_filetype(['c', 'cpp'], 'sources', ['around', 'clangd'])
call ddc#custom#patch_filetype(['c', 'cpp'], 'sourceOptions', {
      \ 'clangd': {'mark': 'C'},
      \ })
call ddc#custom#patch_filetype('markdown', 'sourceParams', {
      \ 'around': {'maxSize': 100},
      \ })

" Mappings

" <TAB>: completion.
inoremap <silent><expr> <TAB>
\ ddc#map#pum_visible() ? '<C-n>' :
\ (col('.') <= 1 <Bar><Bar> getline('.')[col('.') - 2] =~# '\s') ?
\ '<TAB>' : ddc#map#manual_complete()

" <S-TAB>: completion back.
inoremap <expr><S-TAB>  ddc#map#pum_visible() ? '<C-p>' : '<C-h>'

" Use ddc.
call ddc#enable()
