set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

"自动化设置
"autocmd BufEnter * call DoWordComplete()
"自动切换工作路径
set autochdir
" Set to auto read when a file is changed from the outside
set autoread
"设置文件编码
set encoding=utf-8
set fileencodings=utf-8,chinese,cp936,gb18030,big5,euc-jp,euc-kr,latin1,ucs-bom
"vim提示信息乱码的解决
language messages zh_CN.utf-8
"解决菜单乱码  
source $VIMRUNTIME/delmenu.vim  
source $VIMRUNTIME/menu.vim
"设置字体
set guifont=Consolas:h13:cANSI
colo molokai
syntax on


"设置界面，隐藏工具栏
set shortmess=atI
set guioptions-=T
set guioptions-=m
set guioptions-=L
autocmd GUIEnter * simalt ~X
"总是显示标签栏,1自动，2总是，0总是不显示
set showtabline=2

"functions define
"platform
function! MySys()
	if has("win32")
		return "win"
	else
		return "linux"
	endif
endfunction

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"保存，载入session
fu! SaveSess()
	set sessionoptions-=curdir
	set sessionoptions+=sesdir
	set sessionoptions+=slash
	set sessionoptions+=unix
    "set sessionoptions-=options
    execute 'mksession! $vim/vim-session.vim'
    "execute 'wviminfo! $currProject.viminfo'
endfunction

fu! RestoreSess()
	execute 'source $vim/vim-session.vim'
	"execute 'rviminfo $currProject.viminfo'
endfunction
"设置按键映射
"缺省mapleader为 \
let mapleader=","

autocmd VimLeave * call SaveSess()
""autocmd VimEnter * call RestoreSess()
map <leader>rr :source $vim/vim-session.vim<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=700
set nobackup
set noswapfile

"显示行号
set number
set ruler
"tab宽度
set shiftwidth=4
set tabstop=4
"tab用空格代替"
""变量名 	 缩写 	 含义 
"" tabstop=X 	 ts 	 编辑时一个TAB字符占多少个空格的位置。 
"" shiftwidth=X 	 sw 	 使用每层缩进的空格数。 
"" (no)expandtab 	 (no)et 	 是否将输入的TAB自动展开成空格。开启后要输入TAB，需要Ctrl-V<TAB> 
"" softtabstop=X 	 sts 	 方便在开启了et后使用退格（backspace）键，每次退格将删除X个空格 
"" (no)smarttab 	 (no)sta 	 开启时，在行首按TAB将加入sw个空格，否则加入ts个空格。
set expandtab
set softtabstop=4
set showmatch
"自动文件类型
filetype on
set langmenu=zh_CN.UTF-8
set helplang=cn
" Enable filetype plugins
filetype plugin indent on


""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2
" Format the status line
"set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \[POS=%l,%v][%p%%]
set statusline=\ pwd:\ %r%{getcwd()}%h\ \ \[POS=%l,%v]\ \ \[%p%%] 

" Fast saving
nmap <leader>w :w!<cr>
"map <leader>q :wq<cr>
map <leader>tn :tabnew<cr>
map <leader>tc :tabc<cr>
map <leader>` :tabnext<cr>
map <leader>~ :tabprev<cr>
map <leader>] :tabnext<cr>
map <leader>[ :tabprev<cr>
nmap <TAB> :tabnext<cr>
" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

"使用系统剪切板"
map <leader>y "+y
map <leader>p "+p

map <leader>i %i

" 回车换行 "
nmap <ENTER> o<ESC>
"nmap <BACKSPACE> dd<ESC>

"自动补全
inoremap " ""<LEFT>
inoremap ' ''<LEFT>
inoremap { {}<LEFT>
inoremap [ []<LEFT>
inoremap ( ()<LEFT>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"快捷_vimrc文件编辑
map <silent> <leader>ss :source $vim/_vimrc<cr>
map <silent> <leader>ee :tabe $vim/_vimrc<cr>
"_vimrc保存后，自动重载
autocmd! bufwritepost _vimrc source $vim/_vimrc
 
"对搜索的设置
map ft :call Search_Word()<CR>:clist<CR>
function! Search_Word()
    let w = expand("<cword>") " 在当前光标位置抓词
    execute "vimgrep " w " *"
endfunction


"插件相关设置
"NERD Tree
map <leader>nt :NERDTreeToggle<cr>
map <leader>nf :NERDTreeFind<cr>
"map <leader>nb :NERDTreeFromBookmark<cr>
"NERD Commenter"
let NERDShutUp=1

"neocomplcache
"let g:neocomplcache_enable_at_startup=1
