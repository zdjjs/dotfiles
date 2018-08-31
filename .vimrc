set encoding=utf-8
scriptencoding=utf-8
set fileencodings=utf-8

"表示設定
syntax enable "シンタックスを有効
filetype plugin indent on "ファイルタイプ検出とプラグインの有効化
set number "行番号を表示する
set title "編集中のファイル名を表示
set showmatch "括弧入力時の対応する括弧を表示
set background=dark
colorscheme Tomorrow-Night-Eighties "カラースキーマ―
set t_Co=256 "256色使う
set smartindent "オートインデント
set cindent "Cスタイルのインデント
set ruler "ルーラーの表示
set showcmd "入力中のコマンド表示

set cursorline "カーソル行を強調
set scrolloff=4 "上下4行分
set sidescrolloff=8 "左右8文字分
set sidescroll=1 "左右一文字ずつスクロール

set laststatus=2 "ステータスラインを表示
set cmdheight=2 "メッセージ欄を2行

"タブとスペース
set noexpandtab
set tabstop=4
set shiftwidth=4
set softtabstop=0

"タブ、スペース、行末、全角スペースなど
set list
set listchars=tab:>-,trail:.,extends:>,precedes:<,nbsp:%

"highlight ZenkakuSpace cterm=underline ctermbg=red guibg=#666666
"au BufWinEnter * let w:m3 = matchadd("ZenkakuSpace", ' ')
"au WinEnter * let w:m3 = matchadd("ZenkakuSpace", ' ')

"検索設定
set ignorecase "大文字/小文字の区別なく検索する
set smartcase "検索文字列に大文字が含まれている場合は区別して検索する
set wrapscan "検索時に最後まで行ったら最初に戻る
set hlsearch "語句のハイライト

"undo保存
if has('persistent_undo')
	set undodir=~/.vim/undo
	set undofile
endif

"カーソル位置記憶
if has("autocmd")
	augroup redhat
		" In text files, always limit the width of text to 78 characters
		autocmd BufRead *.txt set tw=78
		" When editing a file, always jump to the last cursor position
		autocmd BufReadPost *
		\ if line("'\"") > 0 && line ("'\"") <= line("$") |
		\   exe "normal! g'\"" |
		\ endif
	augroup END
endif
