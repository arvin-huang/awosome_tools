"设置行号
set number

"设置高亮
syntax on 

"按 F2 进入粘贴模式
set pastetoggle=<F2>
" F8 打开 Tagbar
" 需要安装 gotags
nmap <F8> :TagbarToggle<CR>
let g:tagbar_autofocus = 1
let g:tagbar_width = 60 
let g:tagbar_type_go = {
	\ 'ctagstype' : 'go',
	\ 'kinds'     : [
		\ 'p:package',
		\ 'i:imports:1',
		\ 'c:constants',
		\ 'v:variables',
		\ 't:types',
		\ 'n:interfaces',
		\ 'w:fields',
		\ 'e:embedded',
		\ 'm:methods',
		\ 'r:constructor',
		\ 'f:functions'
	\ ],
	\ 'sro' : '.',
	\ 'kind2scope' : {
		\ 't' : 'ctype',
		\ 'n' : 'ntype'
	\ },
	\ 'scope2kind' : {
		\ 'ctype' : 't',
		\ 'ntype' : 'n'
	\ },
	\ 'ctagsbin'  : 'gotags',
	\ 'ctagsargs' : '-sort -silent'
\ }


"高亮所在列
set cursorcolumn

"高亮所在行
set cursorline

"设置 leader 键
let mapleader=","

"设置 ,w 保存
inoremap <leader>w <Esc>:w<cr>

"设置 jj 从 Insert => Normal
inoremap jj <Esc>

"设置 Normal下 ctrl+h/j/k/l 切换窗口
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

"设置安装的主题插件
set background=dark
colorscheme hybrid

"nerdtree 设置
"查找文件在目录位置
nnoremap <leader>f :NERDTreeFind<cr>

"打开/关闭
nnoremap <leader>g :NERDTreeToggle<cr>

"设置宽度
let NERDTreeWinSize=31

"显示隐藏文件
let NERDTreeShowHidden=1

"忽略文件
let NERDTreeIgnore = [
             \ '\.git$', '\.hg$', '\.svn$', '\.stversions$', '\.pyc$', '\.pyo$', '\.swp$',
             \ '\.DS_Store$', '\.sass-cache$', '__pycache__$', '\.egg-info$', '\.ropeproject$',
             \ ]

"ctrlp 设置
let g:ctrlp_map = '<c-p>'

"airline
set laststatus=2

"vim-gitgutter
set updatetime=100

"coc-go
autocmd FileType go nmap gtj :CocCommand go.tags.add json<cr>
autocmd FileType go nmap gty :CocCommand go.tags.add yaml<cr>
autocmd FileType go nmap gtx :CocCommand go.tags.clear<cr>


"安装 vim-plug 文档:https://github.com/junegunn/vim-plug
"管理插件
call plug#begin()

"vim 开屏插件
Plug 'mhinz/vim-startify'

"状态栏
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"缩进线
Plug 'Yggdroot/indentLine' 

"主题
Plug 'w0ng/vim-hybrid'

"文件目录
Plug 'preservim/nerdtree'

"模糊搜索文件
Plug 'ctrlpvim/ctrlp.vim'

"成对编辑
Plug 'tpope/vim-surround' "ys ds cs 

"vim-go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

"代码大纲
Plug 'preservim/tagbar'

"代码补全
"Use release branch (recommend)
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"Or build from source code by using yarn: https://yarnpkg.com
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}

"代码注释
Plug 'tpope/vim-commentary'


"git集成
Plug 'tpope/vim-fugitive'

"git文件变动
Plug 'airblade/vim-gitgutter'

"括号引号自动补全
Plug 'jiangmiao/auto-pairs'

call plug#end()