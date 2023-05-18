" 不兼容vi
set nocompatible

" 文件格式
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on

" 配色
let &t_ut=''

" 支持鼠标
set mouse=a

" 设置编码
set encoding=utf-8

" 设置状态
set laststatus=2

" 底部倒数第5行保持光标不动
set scrolloff=5

" 保持在当前文件路径下执行命令
set autochdir

" 保持重新打开文件光标停在上次编辑位置
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


set backspace=indent,eol,start

" 设置没有备份文件
set nobackup

" 按 F2 进入粘贴模式
set pastetoggle=<F2>

" 在命令行上显示当前光标所在行号和列号的信息
set ruler

colorscheme desert

" 设置leader键
let mapleader=" "

" 高亮
syntax on;

" 普通模式下保存
map S :w<CR>

" 普通模式下退出
map Q :q<CR>

" 普通模式下刷新vim配置
map R :source $MYVIMRC<CR>

" 向下移动5行
noremap D 5j

" 向上移动5行
noremap U 5k

" 删除搜索结果
noremap <LEADER><CR> :noh<CR>

" 往上分屏,且光标在上边
map sk :set nosplitbelow<CR>:sp<CR>

" 往上分屏,且光标在下边
map sj :set splitbelow<CR>:sp<CR>

" 往右分屏,且光标移动至右边
map sl :set splitright<CR>:vs<CR>

" 往右分屏，光标在左边
map sh :set nosplitright<CR>:vs<CR>

" 分屏光标移动
map <LEADER>h <C-w>h
map <LEADER>j <C-w>j
map <LEADER>k <C-w>k
map <LEADER>l <C-w>l

" 上下左右调节分屏大小
map <up> :res +5<CR>
map <down> :res -5<CR>
map <left> :vertical resize-5<CR>
map <right> :vertical resize+5<CR>

" 标签
" 新增一个标签页
map tn :tabe<CR>
" 上一个标签页
map th :-tabnext<CR>
" 下一个标签页
map tl :+tabnext<CR>


" 设置命令显示
set showcmd

" 设置折行
set wrap

" 设置行号
set number

" 设置相对行号
set relativenumber

" 高亮所在行
set cursorline

" 高亮所在列
" set cursorcolumn

" 设置搜索高亮
set hlsearch

" 边输入边高亮
set incsearch

" 清空上次搜索结果
exec "nohlsearch"

" 忽略大小写
set ignorecase

" 精确搜索时区分大小写
set smartcase

" 显示补齐菜单选项
set wildmenu

" jj 返回normal模式
inoremap jj <Esc>

" vim 插件

call plug#begin('~/.vim/plugged')

" 底部状态栏
Plug 'vim-airline/vim-airline'


" 文件树
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'

" 侧边栏标签
Plug 'majutsushi/tagbar', { 'on': 'TagbarOpenAutoClose' }

" 缩进线
Plug 'nathanaelkane/vim-indent-guides'

"成对编辑
Plug 'tpope/vim-surround' "ys ds cs

" coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()


" vim 插件配置

map ff :NERDTreeToggle<CR>


" NERDTree-git
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }


map <silent> T :TagbarOpenAutoClose<CR>

" coc
let g:coc_global_extensions = [
                        \'coc-json',
                        \'coc-vimlsp']

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
d
" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-space> coc#refresh()
endif
