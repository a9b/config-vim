""
" TIPS "▼インデントに関して
"一々ノーマルモードに戻るのも面倒なので、挿入モードのままインデントをしましょう。
"挿入モード中にインデントをするには、<C-T> (Ctrlを押しながらT)を押します。
"これで、オプション'shiftwidth'で設定した価だけインデントされます。
"逆にインデントを一段解除したい場合は、<C-D>を押します。
"インデントをなくしたい場合は、0<C-D>と押してください。
"▼外部ファイルのペーストの方法
":a!
"ペースト
"ESC
"
"▼コマンドモードとインサートモード
"<C-O>を押すと一時的にノーマルモードに移行します。
"

" ファイルタイプでプラグインの振り分け
filetype indent on
filetype plugin on

"カラースキーマをダウンロードしたら「$HOME/vimfiles/colors/」以下に配置してください。
"カラースキーマを設定
"colorscheme zenburn
colorscheme desert

" ポップアップメニューのカラーを設定
hi Pmenu guibg=#666666
hi PmenuSel guibg=#8cd0d3 guifg=#666666
hi PmenuSbar guibg=#333333

" 拡張子の関連付け
augroup filetypedetect
au! BufRead,BufNewFile *.class setfiletype php
augroup END

" 辞書の設定
" http://nanasi.jp/articles/howto/config/dictionary.html
set dictionary=~/.vim/dict/unit.dict
autocmd FileType php :set dictionary=~/.vim/dict/php.dict
autocmd FileType html :set dictionary=~/.vim/dict/html.dict

" スケルトンの作成
autocmd BufNewFile *.php      0r ~/.vim/skel/sample.php
autocmd BufNewFile *.html    0r ~/.vim/skel/sample.html

" 拡張子ごとで読み込むファイル
"set fexrc

" インデントの種類(manual,indent,expr,marker,syntax,diff)
"set foldmethod=indent

" 貼付けの自動インデント無効(短縮入力無効)
" set paste

" ステータスラインの表示
set laststatus=2

" 行数の表示
set number

" タブの表示
set showtabline=1

" タブの最大数
set tabpagemax=15

" 括弧の入力時にカーソルを対応する括弧の上に一定時間表示させる
set showmatch
set matchtime=5

" システムのクリップボードを使う
set clipboard=unnamed

" 文字を選択しただけで、クリップボードにコピー
set guioptions+=a

" 標準的なMS-WindowsのCTRL-X、CTRL-CおよびCTRL-Vを使う
"source $VIMRUNTIME/mswin.vim

" 小文字の検索で大文字も見つかるようにする(検索時に大文字小文字を無視する)
" 大文字を混ぜて検索した場合だけ大文字/小文字を区別する
set ignorecase
set smartcase

" 検索文字を打ち込むと即検索する（インクリメンタルサーチ）
set incsearch

" 検索結果をハイライト表示します
set hlsearch

" タブの入力を空白文字に置き換える
set expandtab

" オートインデント
set autoindent
set cindent

" 利口なオートインデントをONにする。
set smartindent

" タブの文字数(タブストップ)を設定する
set tabstop=4

" 補完候補がコマンドラインのすぐ上の行に表示
set wildmenu

" ファイル操作に関する設定:
" バックアップファイルを作成しない (コメント or コメントアウト)
set nobackup
set nowritebackup
"set directory

" バックアップファイルを指定のディレクトリに保存
set backupdir=/tmp

" スワップファイルを作成するディレクトリ
" set dir=/tmp

" スワップファイルを使用しない
" set updatecount=0

" バッファ切り替え操作時に自動保存する
"set autowrite

" ファイル終了時も自動保存する
"set autowriteall

" ファイルが外部で変更されていた場合に、自動で読み込む
set autoread

" コマンドライン補完するときに補完候補を表示する
set wildmenu

" 自動で:hideを付加するオプション
set hidden

" ネットワーク設定
set nocp
if version >= 600
   filetype plugin indent on
   endif

" 'compatible' をオフにする
set nocp

"vim7で搭載されたオムニ補完 (Omni completion)
".vimrcに以下を記述すると指定された言語のコード補完が可能になります。
"しかしこれは、Dream Weaverのような自動補完ではありません。
"CSSファイルを開いてオムニ補完を使用し、background- colorを補完させたい場合、
"挿入モードで「back」ぐらいまで入力して、以下のコマンドを入力。
"[Ctrl]-x , [Ctrl]-o

autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete

""
" php.vim setting
let php_folding       = 1
let php_sql_query     = 1
let php_htmlInStrings = 1

let PHP_BracesAtCodeLevel = 0

""
" GetStatusEx
" ステータス表示用function
function! GetStatusEx()
	let str = ''
	let str = str . '[' . &fileformat . ']'
	if has('multi_byte') && &fileencoding != ''
	let str = '[' . &fenc . ']' . str
	endif
	return str
	endfunction
	set statusline=%m%r%F%=%y%{GetStatusEx()}<%c:%l/%L(%p%%)>
hi StatusLine term=NONE cterm=NONE ctermfg=black ctermbg=green


"""""""""""""""""""""""""""""""""""""""""""""""""""
" キー割り当て
"""""""""""""""""""""""""""""""""""""""""""""""""""
" escのキーバインド変更
imap <C-k> <esc>

" 保存のキーバインド変更
map <C-S> <ESC>:w<CR>

" mapping prefix key.
nnoremap [mapping] <Nop>
nmap <Space>j [mapping]

" 保存
nnoremap <silent> [mapping]w :<ESC>:w<CR>

" バッファを閉じる
nnoremap <silent> [mapping]q :<ESC>:q<CR>

" sourceの再読み込み
nnoremap <silent> [mapping]ss <ESC>:w<CR>:source ~/.vimrc<CR>

" matrix
nnoremap <silent> [mapping]m :<ESC>:Matrix<CR>

" 貼付け
nnoremap <silent> [mapping]a :<ESC>:a!<CR> 

" バッファを開く
map ,b :ls<CR>:buf

" 日付
map ,d :r! date "+\%Y/\%m/\%d \%H:\%M:\%S" <CR> k J A

" 関数
map ,f :vimgrep /function /j % <LEFT><LEFT><LEFT><LEFT><LEFT>
au QuickfixCmdPost vimgrep cw

" homeに移動
map ,h :cd $HOME <CR>:tabnew <CR>:E <CR>

" パスを変更してフォルダを開く
map ,o :cd %:h <CR>:tabnew <CR>:E <CR>

" 置換
map ,r :%s///g <LEFT><LEFT><LEFT><LEFT>

" 新規タブ
map ,t :tabnew

" 新規ウィンド
map ,v :vsp<SPACE>
map ,s :split<SPACE>

" 検索語が画面の真ん中に来るようにする
nmap n nzz
nmap N Nzz
nmap * *zz
nmap # #zz
nmap g* g*zz
nmap g# g#zz

map <C-L> :bn<CR>
map <C-H> :bp<CR>

" 各サーバーSSH
nmap ,svhoge :E scp://root@hogea.net//var/www/<CR>

" yankを異なるプロセス間で使用
map <silent> sy :call YanktmpYank()<cr>
map <silent> sp :call YanktmpPaste_p()<cr>
map <silent> sP :call YanktmpPaste_P()<cr>

let g:yanktmp_file = '/tmp/yanktmp'

" http://tochiii.blog119.fc2.com/blog-entry-220.html
"nmap <Space>b :ls<CR>:buffer
"nmap <Space>f :edit .<CR>
"nmap <Space>v :vsplit<CR><C-w><C-w>:ls<CR>:buffer
"nmap <Space>V :Vexplore!<CR><CR>

" 選択部分をクリップボードにコピー
"vmap <C-C> "*y

" 挿入モード時、クリップボードから貼り付け
"imap <C-V> <ESC>"*pa

" 選択部分をクリップボードの値に置き換え
"vmap <C-V> d"*P

"コマンドライン時、クリップボードから貼り付け
"cmap <C-V> <C-R>*

" 選択部分をクリップボードに切り取り
"vmap <C-X> "*d<ESC>

" 文字コードの自動認識
if &encoding !=# 'utf-8'
set encoding=japan
set fileencoding=japan
endif
if has('iconv')
let s:enc_euc = 'euc-jp'
let s:enc_jis = 'iso-2022-jp'
" iconvがeucJP-msに対応しているかをチェック
if iconv("\x87\x64\x87\x6a", 'cp932', 'eucjp-ms') ==# "\xad\xc5\xad\xcb"
let s:enc_euc = 'eucjp-ms'
let s:enc_jis = 'iso-2022-jp-3'
" iconvがJISX0213に対応しているかをチェック
elseif iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
let s:enc_euc = 'euc-jisx0213'
let s:enc_jis = 'iso-2022-jp-3'
endif
" fileencodingsを構築
if &encoding ==# 'utf-8'
let s:fileencodings_default = &fileencodings
let &fileencodings = s:enc_jis .','. s:enc_euc .',cp932'
let &fileencodings = &fileencodings .','. s:fileencodings_default
unlet s:fileencodings_default
else
let &fileencodings = &fileencodings .','. s:enc_jis
set fileencodings+=utf-8,ucs-2le,ucs-2
if &encoding =~# '^\(euc-jp\|euc-jisx0213\|eucjp-ms\)$'
set fileencodings+=cp932
set fileencodings-=euc-jp
set fileencodings-=euc-jisx0213
set fileencodings-=eucjp-ms
let &encoding = s:enc_euc
let &fileencoding = s:enc_euc
else
let &fileencodings = &fileencodings .','. s:enc_euc
endif
endif
" 定数を処分
unlet s:enc_euc
unlet s:enc_jis
endif

" 日本語を含まない場合は fileencoding に encoding を使うようにする
if has('autocmd')
function! AU_ReCheck_FENC()
if &fileencoding =~# 'iso-2022-jp' && search("[^\x01-\x7e]", 'n') == 0
let &fileencoding=&encoding
endif
endfunction
autocmd BufReadPost * call AU_ReCheck_FENC()
endif

" 改行コードの自動認識
set fileformats=unix,dos,mac

" □とか○の文字があってもカーソル位置がずれないようにする
if exists('&ambiwidth')
 set ambiwidth=double
 endif

" ファイルを書き込む直前に'backupext'にタイムスタンプを含める
au BufWritePre * let &bex = '-' . strftime("%Y%b%d%X") . '~'

" ESCの連打でハイライトを消す
nnoremap <ESC><ESC> :nohlsearch<CR>
nnoremap <C-k><C-k> :nohlsearch<CR>

" 補完後のスペースを除去
func Eatchar(pat)
let c = nr2char(getchar(0))
return (c =~ a:pat) ? '' : c
endfunc
""""""""""""""""""""""""""""""""""""""""""""""""""
" 補完
""""""""""""""""""""""""""""""""""""""""""""""""""
inoreabbrev ed # editer seki <ESC>a<C-R>=Eatchar('\s')<CR>
inoreabbrev au #<Space>auther<Space>seki <ESC><C-R>=Eatchar('\s')<CR>
inoreabbrev to #<Space>[TODO]<Space>seki <ESC><C-R>=Eatchar('\s')<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""
" php
""""""""""""""""""""""""""""""""""""""""""""""""""
"inoreabbrev if <ESC>:a!<CR>if($ ){<CR><CR>}//if<CR>.<CR><UP><UP>f$i
inoreabbrev if if($){<CR><CR>}//if<ESC><<kk0f$a<C-R>=Eatchar('\s')<CR>
inoreabbrev fe foreach($ =>$k as $v){<CR><CR>}//foreach<ESC>kk0f$a<C-R>=Eatchar('\s')<CR>
inoreabbrev fo for($i=0;$i<10;$i++){<CR><CR>}//for<UP><C-R>=Eatchar('\s')<CR>
inoreabbrev ar array(""=>"");<C-R>=Eatchar('\s')<CR><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><C-R>=Eatchar('\s')<CR>
inoreabbrev ph <?php  ?><LEFT><LEFT><LEFT><C-R>=Eatchar('\s')<CR>
inoreabbrev pe <?php e(); ?><LEFT><LEFT><LEFT><LEFT><LEFT><C-R>=Eatchar('\s')<CR>
inoreabbrev fu function (){<CR><CR><CR>}//function<UP><UP><UP><LEFT><LEFT><C-R>=Eatchar('\s')<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""
" cake
""""""""""""""""""""""""""""""""""""""""""""""""""
inoreabbrev lm $this->loadModel('');<LEFT><LEFT><LEFT><C-R>=Eatchar('\s')<CR>
inoreabbrev fi <?php e($form->input(""));?><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><C-R>=Eatchar('\s')<CR>
inoreabbrev fh <?php e($form->hidden(""));?><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><C-R>=Eatchar('\s')<CR>
inoreabbrev re $this->redirect("");<LEFT><LEFT><LEFT><C-R>=Eatchar('\s')<CR>
inoreabbrev se $this->set(compact(""));<LEFT><LEFT><LEFT><LEFT><C-R>=Eatchar('\s')<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""
" html
""""""""""""""""""""""""""""""""""""""""""""""""""
inoreabbrev pi <?php if($){ ?><CR><?php }else{ ?><CR><?php }//if ?><UP><UP><LEFT><LEFT><LEFT><LEFT><C-R>=Eatchar('\s')<CR>
inoreabbrev hi <input type="submit" name="submit" value="送信"><C-R>=Eatchar('\s')<CR>
inoreabbrev ta <table class="sheet"><CR><tr><CR><td></td><CR></tr><CR><table><ESC>kk0t/ha<C-R>=Eatchar('\s')<CR>
inoreabbrev td <td><C-R>=Eatchar('\s')<CR>
inoreabbrev di <div style="text-align:center;"><CR><CR></div><UP><C-R>=Eatchar('\s')<CR>
inoreabbrev jc onClick="return confirm('Do you really delete it?')"<C-R>=Eatchar('\s')<CR>
inoreabbrev fs <input type="submit" value="submit"><C-R>=Eatchar('\s')<CR>




"unite prefix key.
nnoremap [unite] <Nop>
nmap <Space>f [unite]

"unite general settings
"インサートモードで開始
let g:unite_enable_start_insert = 1
"最近開いたファイル履歴の保存数
let g:unite_source_file_mru_limit = 100

"file_mruの表示フォーマットを指定。空にすると表示スピードが高速化される
let g:unite_source_file_mru_filename_format = ''

"現在開いているファイルのディレクトリ下のファイル一覧。
" 全部乗せ
nnoremap <silent> [unite]a :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>
"開いていない場合はカレントディレクトリ
nnoremap <silent> [unite]f :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
"バッファ一覧
nnoremap <silent> [unite]b :<C-u>Unite buffer<CR>
"レジスタ一覧
nnoremap <silent> [unite]r :<C-u>Unite -buffer-name=register register<CR>
"最近使用したファイル一覧
nnoremap <silent> [unite]m :<C-u>Unite file_mru<CR>
"ブックマーク一覧
nnoremap <silent> [unite]c :<C-u>Unite bookmark<CR>
"ブックマークに追加
nnoremap <silent> [unite]a :<C-u>UniteBookmarkAdd<CR>
"uniteを開いている間のキーマッピング
autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()"{{{
        "ESCでuniteを終了
        nmap <buffer> <ESC> <Plug>(unite_exit)
        imap <buffer> <C-k> <Plug>(unite_exit)
        nmap <buffer> <C-k> <Plug>(unite_exit)
        "入力モードのときjjでノーマルモードに移動
        imap <buffer> jj <Plug>(unite_insert_leave)
        "入力モードのときctrl+wでバックスラッシュも削除
        imap <buffer> <C-w> <Plug>(unite_delete_backward_path)
        "ctrl+jで縦に分割して開く
        nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
        inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
        "ctrl+jで横に分割して開く
        nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
        inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
        "ctrl+oでその場所に開く
        nnoremap <silent> <buffer> <expr> <C-o> unite#do_action('open')
        inoremap <silent> <buffer> <expr> <C-o> unite#do_action('open')
        " 単語単位からパス単位で削除するように変更
        imap <buffer> <C-w> <Plug>(unite_delete_backward_path)
endfunction"}}}


