" ========================================================
" Owner:  王涵
" Email:  daoshuti@163.com
" Github: https://github.com/daoshuti/dst_vimconfig
" ========================================================

" GENERAL SETTINGS:
" 通用设置:

" ========================================================{{{1

" To use VIM settings, out of VI compatible mode.
set nocompatible

set encoding=utf-8      " 使用utf-8编码格式
scriptencoding utf-8    " vim脚本使用 utf-8格式
set fileencodings=utf-8 " 文件缓冲区，使用utf-8编码格式
set termencoding=utf-8  " terminal使用utf-8编码格式
set fileformat=unix     " 文件格式设置为unix

" Set Dos Mode
if has('win32') || has('win64')
    set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
endif

" Syntax highlighting.
if has("syntax")
    syntax on
endif

" Enable file type detection.
filetype on
filetype plugin indent on " 开启三个功能：文件类型检查、插件、缩进

" Other settings.
set autoindent          " 创建新行自动缩进
set cindent             " 开启针对c文件的缩进
set cinoptions=:0       " C程序中switch-case预计默认缩进0个字符
set smartindent	        " 开启智能缩进，它不像cindent那样完美支持c文件的缩进，但对于未知类型文件的缩进，还是有帮助的

set autoread            " 文件在Vim之外修改过，自动重新读入
set autowrite
set hidden

set backspace=indent,eol,start
set completeopt=longest,menuone " vim插入模式补全设置
"set pumheight=10        " 插入模式补全的弹出菜单的最大数目

set tabstop=4           " 制表符为4
set noexpandtab         " 不把制表符替换为空格
"set expandtab          " 制表符替换为空格
set shiftwidth=0        " 换行时使用0个空格，使用tab键风格时如此设置
"set shiftwidth=4       " 换行时使用4个空格

set number              " 显示行号
set t_Co=256            " 开启256颜色
set scrolloff=5         " 键盘上下滚动屏幕的最小临界行数
set cursorcolumn        " 高亮光标所在屏幕列
set cursorline          " 高亮光标所在屏幕行
set nowrap              " 禁止文字自动换行
"set textwidth=256      " 超过256个字符自动换行
set mouse=a             " 可以使用鼠标
set laststatus=2        " 指定何时显示状态行
                        " 0 永远没有
                        " 1 只有分割窗口时(默认值)
                        " 2 总是存在
"set ruler              " 状态栏显示光标所在行列的位置


set foldenable          " 开启折叠功能
set foldmethod=marker   " 代码折叠(标签折叠方式)
"set foldmethod=indent  " 代码折叠（缩进折叠方式）
"set foldmethod=syntax  " 代码折叠（语法折叠方式）
set foldcolumn=0        " 每行前面有0个折叠标识列

set helpheight=10       " 帮助窗口高度
set helplang=cn         " 帮助系统设置为中文
set history=1000        " 历史记录保留1000条

set ignorecase          " 搜索模式，忽略大小写
set smartcase           " 搜索模式，输入小写字符，其结果包含大小写字符(仅在ignorecase打开时)
set incsearch           " highlight搜索结果
set hlsearch            " 输入搜索命令时也会highlight

set wildmenu            " 命令行补全增强
set wildmode=list:longest,full " 命令行补全设置
set showcmd             " 显示命令

set nobackup            " 取消备份
set noswapfile          " 不使用swapfile文件（不能灾难恢复）

" gui settings
if has("gui_running")
    "set guioptions-=m " no menubar 将Gvim中的菜单栏去除
    set guioptions-=T " no toolbar 将Gvim中的工具栏去除
    set guioptions-=r " no right-hand scrollbar 将右边的滚动条去除
    set guioptions-=R " no right-hand vertically scrollbar 将右边的垂直滚动条去除
    set guioptions-=l " no left-hand scrollbar 将左边的滚动条去除
    set guioptions-=L " no left-hand vertically scrollbar 将左边边的垂直滚动条去除
    autocmd GUIEnter * simalt ~x " window width and height
    source $VIMRUNTIME/delmenu.vim " the original menubar has an error on win32, so
    source $VIMRUNTIME/menu.vim    " use this menubar
    language messages zh_CN.utf-8 " use chinese messages if has
    set guifont=Consolas:h14
endif

" ========================================================}}}1

" PLUGINS MANAGE:
" 插件管理:

" ========================================================{{{1

" 指定插件所在目录
" --------------------------------------------------------{{{2
" specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
" 简化写法省略前面的github网址前缀，当然全写也是OK的


" --------------------------------------------------------}}}2
" UI插件
" --------------------------------------------------------{{{2

" vim start panel
Plug 'mhinz/vim-startify'

" some colorsthemes
"Plug 'flazz/vim-colorschemes'

" solarized colorstheme
"Plug 'altercation/vim-colors-solarized'

" molokai colorstheme
Plug 'tomasr/molokai'

" airline 状态栏插件
Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'

" 将代码行最后无效的空格标红
Plug 'bronson/vim-trailing-whitespace'

" highlight current word
Plug 'dominikduda/vim_current_word'

" 缩进UI标识
Plug 'Yggdroot/indentLine'

" 彩虹括号
Plug 'luochen1990/rainbow'

" 搜索单词内部，如果也包含关键字则高亮
Plug 'google/vim-searchindex'

" --------------------------------------------------------}}}2
" 直接加载的插件
" --------------------------------------------------------{{{2

" vimcdoc中文vim文档
Plug 'yianwillis/vimcdoc'

" Terminal
if has('python2') " only python2
	Plug 'rosenfeld/conque-term'
endif

" 格式化对齐，代码中的等号
"Plug 'junegunn/vim-easy-align' " 有趣，但是非高频使用，暂时注释掉

"buffer管理
"Plug 'fholgado/minibufexpl.vim'

" markdown
"Plug 'plasticboy/vim-markdown'

" ctrlp快速搜索文件并打开
"Plug 'kien/ctrlp.vim' " 有用，但是非高频使用注释掉

" 输入时自动配对括号
Plug 'jiangmiao/auto-pairs'


" 语法检查，需配合相应的语法检查器
"Plug 'vim-syntastic/syntastic'

let g:dst_complete_mode='old'
"let g:dst_complete_mode='YouCompleteMe'
"let g:dst_complete_mode=''

" ctags管理
"Plug 'ludovicchabant/vim-gutentags'
Plug 'daoshuti/vim-gutentags'

if g:dst_complete_mode is# 'old'
	" AutoComplPop 是按字典进行补全的，只有你输入过的单词才可以补全
	" 默认只有输入两个字符，才会提示
	" vim输入时自动补全提示 比较古老，暂无好的替代品
	Plug 'eikenb/acp'
	" vim 字典仓库
	Plug 'skywind3000/vim-dict'
	" C++代码补全，比较古老，不是很好用
	Plug 'vim-scripts/OmniCppComplete'
elseif g:dst_complete_mode is# 'YouCompleteMe'
	Plug 'ycm-core/YouCompleteMe'
else
	echomsg 'Please set g:dst_complete_mode!'
endif

" 代码片段自动补全插件
if has('python3')
	Plug 'SirVer/ultisnips'
	Plug 'honza/vim-snippets'
endif

" --------------------------------------------------------}}}2
" 延迟按需加载，使用到命令的时候再加载的插件
" --------------------------------------------------------{{{2

" On-demand loading

" 浏览文件的插件
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" 代码速览插件(用tagbar替代了taglist)
Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }

" vim中的git插件
Plug 'tpope/vim-fugitive', { 'on': 'Git' }

" 窗口切换
Plug 't9md/vim-choosewin', { 'on': 'ChooseWin' }

" 异步检查vim中的语法问题并提示
"Plug 'w0rp/ale', { 'on': 'ALEToggle' }

" gocode go语言代码补全插件
"Plug 'mdempsky/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }

" --------------------------------------------------------}}}2
" 开始初始化插件
" --------------------------------------------------------{{{2
" Initialize plugin system
call plug#end()
" --------------------------------------------------------}}}2


" ========================================================}}}1

" SINGLE PLUGIN SETTINGS:
" 每个插件的设置

" ========================================================{{{1

" --------------------------------------------------------}}}2
" vim startify
" --------------------------------------------------------{{{2
if isdirectory(expand("~/.vim/plugged/vim-startify"))

	"http://patorjk.com/software/taag
	let g:startify_custom_header = [
				\ '  __           __                                                           ___                 ',
				\ ' /\ \         /\ \__               __                                     / ___\ __             ',
				\ ' \_\ \    ____\ \ ,_\      __  __ /\_\    ___ ___     ___    ___     ___ /\ \__//\_\     __     ',
				\ ' / _\ \  / ,__\\ \ \/     /\ \/\ \\/\ \ /  __` __`\  / ___\ / __`\ /  _ `\ \ ,__\/\ \  / _ `\   ',
				\ '/\ \L\ \/\__, `\\ \ \_    \ \ \_/ |\ \ \/\ \/\ \/\ \/\ \__//\ \L\ \/\ \/\ \ \ \_/\ \ \/\ \L\ \  ',
				\ '\ \___,_\/\____/ \ \__\    \ \___/  \ \_\ \_\ \_\ \_\ \____\ \____/\ \_\ \_\ \_\  \ \_\ \____ \ ',
				\ ' \/__,_ /\/___/   \/__/     \/__/    \/_/\/_/\/_/\/_/\/____/\/___/  \/_/\/_/\/_/   \/_/\/___L\ \',
				\ '                                                                                         /\____/',
				\ '                                                                                         \_/__/ ',
				\ ' +------------------------------+-------------------------------+-----------------------+',
				\ ' |         <Fn>键的功能         |       cscope命令说明          |     标签页快捷键      |',
				\ ' +------------------------------+-------------------------------+-----------------------+',
				\ ' | <F1> vim help 窗口           | :cs show 查看已加载的数据库   | ,c   创建新标签页     |',
				\ ' | <F1> vim help 窗口           | :cs add  加载指定的数据库     | ,x   删除标签页       |',
				\ ' | <F2> tagbar   窗口           | ,ss      查找symbol           | ,[   移动到前一个标签 |',
				\ ' | <F3> 文件浏览 窗口           | ,sg      查找定义             | ,]   移动到下一个标签 |',
				\ ' | <F4> 切换窗口 (panel & tag)  | ,sd      查找本函数调用的函数 |-----------------------+',
				\ ' | <F5> 打开终端                | ,sc      查找调用本函数的函数 |      ctags跳转        |',
				\ ' | <F6> 粘贴模式                | ,st      查找指定的字符串     |-----------------------+',
				\ ' | <F7> 代码折叠                | ,se      查找egrep模式        | Ctrl+]   跳转到定义   |',
				\ ' | <F9> 生成tags                | ,sf      查找并打开文件       | Ctrl+o   返回上一级   |',
				\ ' | <F12>生成cscope.out          | ,si      查找包含本文件的文件 |                       |',
				\ ' +------------------------------+-------------------------------+-----------------------+',
				\ ' |            请在Normal模式使用上述快捷键 (Esc进入Normal, i进入Insert模式)             |',
				\ ' +------------------------------+-------------------------------+-----------------------+',
				\]

	"let g:startify_custom_footer = [
	"			\ '+------------------------------+',
	"			\ '|          Keep Codeing        |',
	"			\ '+------------------------------+',
	"			\]
endif

" --------------------------------------------------------}}}2
" vim-colors-solarized插件
" --------------------------------------------------------{{{2
"if has('gui_running')
"	set background=light " 配色主题的色系设置为light
"else
"	set background=dark  " 配色主题的色系设置为dark
"endif
set background=dark
"if isdirectory(expand("~/.vim/plugged/vim-colors-solarized"))
"	let g:solarized_termcolors=256
"	colorscheme solarized
"endif
if isdirectory(expand("~/.vim/plugged/molokai"))
	colorscheme molokai
endif

" --------------------------------------------------------}}}2
" 配置airline，美化状态栏和顶部tab
" --------------------------------------------------------{{{2

if isdirectory(expand("~/.vim/plugged/vim-airline"))
	"if isdirectory(expand("~/.vim/plugged/vim-airline-themes/"))
	if 0
		" ~/.vim/plugged/vim-airline-themes/autoload/airline/路径下可以查看配色
		"let g:airline_theme='solarized'   " airline配色
		"let g:airline_theme='term_light'  " airline配色
		"let g:airline_theme='biogoo'      " airline配色
		let g:airline_theme='powerlineish'
	endif

	let g:airline#extensions#tabline#enabled = 1 "顶部tab显示"
	let g:airline#extensions#tabline#left_sep = ' '
	let g:airline#extensions#tabline#left_alt_sep = '|'
	let g:airline#extensions#tabline#formatter = 'default'
	let g:airline#extensions#whitespace#enabled=0

	let g:airline_powerline_fonts=0
	if !exists('g:airline_symbols')
		let g:airline_symbols = {}
	endif
	if !has("gui_running")
		let g:airline_symbols.branch = ''
		let g:airline_symbols.readonly = 'R'
		let g:airline_symbols.linenr = 'L:'
		let g:airline_symbols.maxlinenr = ' C'
	endif
endif

" --------------------------------------------------------}}}2
" 配置cscope
" --------------------------------------------------------{{{2
if has("cscope")
	set csto=1
	set cst
	set nocsverb
	if filereadable("cscope.out")
		cs add cscope.out
	endif
	set csverb
endif

" --------------------------------------------------------}}}2
"  Ctags
" --------------------------------------------------------{{{2
" 添加tags文件(以便使用代码跳转和补全)
"set tags+=/usr/include/tags
set tags+=./.tags;,.tags
set tags+=./tags;,tags

" --------------------------------------------------------}}}2
" gutentags 插件设置
" --------------------------------------------------------{{{2
if isdirectory(expand("~/.vim/plugged/vim-gutentags"))
	"开启gutentags debug log
	"运行`:GutentagsToggleEnabled`打开日志
	"运行`:GutentagsToggleTrace`命令打开日志
	"let g:gutentags_define_advanced_commands = 1

	" gutentags 搜索工程目录的标志，当前文件路径向上递归直到碰到这些文件/目录名
	let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']

	" 将自动生成的 ctags/gtags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
	let g:gutentags_cache_dir = expand('~/.cache/tags')

	" 所生成的数据文件的名称
	let g:gutentags_ctags_tagfile = '.tags'
	"let g:gutentags_cscopefile = '.cscope.out'

	" 同时开启 ctags 和 gtags 支持：
	let g:gutentags_modules = []
	if executable('ctags')
		let g:gutentags_modules += ['ctags']
		" 配置 ctags 的参数，老的 Exuberant-ctags 不能有 --extra=+q，注意
		let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
		let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
		let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
		" 如果使用 universal ctags 需要增加下面一行，老的 Exuberant-ctags 不能加下一行
		"let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']
	endif
	if executable('cscope')
		let g:gutentags_modules += ['cscope']
		let g:gutentags_auto_add_cscope = 1
	endif
	"if executable('gtags-cscope') && executable('gtags')
	"	let g:gutentags_modules += ['gtags_cscope']
	"	" 禁用 gutentags 自动加载 gtags 数据库的行为
	"	let g:gutentags_auto_add_gtags_cscope = 0
	"endif
endif

" --------------------------------------------------------}}}2
" markdown 插件设置
" --------------------------------------------------------{{{2

" zr: reduces fold level throughout the buffer //降低buffer的折叠level
" zR: opens all folds // 打开所有的折叠
" zm: increases fold level throughout the buffer //增加buffer的折叠level
" zM: folds everything all the way //一路折叠
" za: open a fold your cursor is on //打开光标所在的折叠区域，再次按下则关闭
" zA: open a fold your cursor is on recursively //已递归方式打开光标的折叠区域
" zv: 打开折叠区域，且不顾关闭折叠区域
" zc: close a fold your cursor is on //关闭光标所在的折叠
" zC: close a fold your cursor is on recursively //递归关闭光标所在的折叠

"if isdirectory(expand("~/.vim/plugged/vim-markdown/"))
if 0
	let g:vim_markdown_folding_disabled = 1 "禁用代码折叠
	set [no]foldenable "vim自带的折叠功能是否开启

	autocmd BufNewFile,BufReadPost *.md set filetype=markdown
	let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']
	let g:markdown_syntax_conceal = 0 "关闭Markdown语法高亮
	let g:markdown_minlines = 100 "支持100行显示（默认50行），开启后可能会卡
endif

" --------------------------------------------------------}}}2
" 配置vim_current_word，自动高亮光标选中的单词
" --------------------------------------------------------{{{2

if isdirectory(expand("~/.vim/plugged/vim_current_word"))
	let g:vim_current_word#enabled = 1 "打开vim_current_word插件
	"let g:vim_current_word#highlight_twins = 1 "高亮相似的词
	let g:vim_current_word#highlight_current_word = 1 "高亮选中的单词
	"let g:vim_current_word#highlight_delay = 1000 "延时1000ms再highlight
	"let g:vim_current_word#highlight_only_in_focused_window = 1 "只高亮当前聚焦窗口
endif

" --------------------------------------------------------}}}2
" 配置rainbow插件，显示彩色的括号
" --------------------------------------------------------{{{2
if isdirectory(expand("~/.vim/plugged/rainbow"))
	let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle
	let g:rainbow_conf = {
				\	'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
				\	'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
				\	'operators': '_,_',
				\	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
				\	'separately': {
				\		'*': {},
				\		'tex': {
				\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
				\		},
				\		'lisp': {
				\			'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
				\		},
				\		'vim': {
				\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
				\		},
				\		'html': {
				\			'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
				\		},
				\		'css': 0,
				\	}
				\}
endif

" --------------------------------------------------------}}}2
" 配置tagbar插件
" --------------------------------------------------------{{{2
if isdirectory(expand("~/.vim/plugged/tagbar"))
	let g:tagbar_left = 1
	let g:tagbar_autoclose = 1
	let g:tagbar_sort = 0
endif

" --------------------------------------------------------}}}2
" 配置NERDTree插件
" --------------------------------------------------------{{{2
if isdirectory(expand("~/.vim/plugged/nerdtree"))
	"let Tlist_Show_One_File=1      " 打开文件时默认打开NERDTree
	let g:NERDTreeWinPos="right"   " 在右侧打NERDTree
	"let g:NERDTreeWinSize=25       " 宽度设置为25个字符
	"let g:NERDTreeShowLineNumbers=1" 显示行号
	let g:NERDTreeQuitOnOpen=1     " 打开文件时关闭NERDTree
endif

"--------------------------------------------------------}}}2
" 配置CrtlP插件
" --------------------------------------------------------{{{2
"if isdirectory(expand("~/.vim/plugged/ctrlp.vim"))
if 0
	let g:ctrlp_map = '<c-p>'
	let g:ctrlp_cmd = 'CtrlP'

	set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
	set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

	let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
	let g:ctrlp_custom_ignore = {
				\ 'dir':  '\v[\/]\.(git|hg|svn)$',
				\ 'file': '\v\.(exe|so|dll)$',
				\ 'link': 'some_bad_symbolic_links',
				\ }
endif

" --------------------------------------------------------}}}2
" 配置OmniCppComplete插件
" --------------------------------------------------------{{{2
" 生成标签文件命令
" 	ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .
" 在对C++文件进行补全时，OmniCppComplete插件需要tag文件中包含C++的额外信息，因此上面的ctags命令不同于以前我们所使用的，它专门为C++语言生成一些额外的信息，上述选项的含义如下：
" 	--c++-kinds=+p : 为C++文件增加函数原型的标签
" 	--fields=+iaS : 在标签文件中加入继承信息(i)、类成员的访问控制信息(a)、以及函数的指纹(S)
" 	--extra=+q : 为标签增加类修饰符。注意，如果没有此选项，将不能对类成员补全
if g:dst_complete_mode is# 'old' && isdirectory(expand("~/.vim/plugged/OmniCppComplete"))
	let g:OmniCpp_DefaultNamespaces=["std"]
	let g:OmniCpp_MayCompleteScope=1
	let g:OmniCpp_SelectFirstItem=2
endif

" --------------------------------------------------------}}}2
" 配置ultisnips插件
" --------------------------------------------------------{{{2

if isdirectory(expand("~/.vim/plugged/ultisnips")) && has('python3')
	" 如果需要更多配置可以在vimrc中输入下面的，不配置使用默认的设置
	let g:UltiSnipsExpandTrigger = "<tab>"
	let g:UltiSnipsListSnippets = "<c-tab>"
	let g:UltiSnipsJumpForwardTrigger = "<tab>"
	let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

	" If you want :UltiSnipsEdit to split your window.
	let g:UltiSnipsEditSplit="vertical"

	if isdirectory(expand("~/.vim/plugged/vim-snippets/"))
		let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/bundle/vim-snippets/UltiSnips']
	endif
endif

" --------------------------------------------------------}}}2
" 配置Man.vim Man手册
" --------------------------------------------------------{{{2
source $VIMRUNTIME/ftplugin/man.vim

" --------------------------------------------------------}}}2
" 配置auto-pairs插件 括号自动补全()[]{}
" --------------------------------------------------------{{{2
if isdirectory(expand("~/.vim/plugged/auto-pairs"))
endif

" --------------------------------------------------------}}}2
" 配置indentLine插件，显示缩进提示符
" --------------------------------------------------------{{{2
if isdirectory(expand("~/.vim/plugged/indentLine"))
	"let g:indentLine_char = '|'
	"let g:indentLine_char_list = ['|', '¦', '┆', '┊']
endif

" --------------------------------------------------------}}}2
" 配置YouCompleteMe插件
" --------------------------------------------------------{{{2
if g:dst_complete_mode is# 'YouCompleteMe' && isdirectory(expand("~/.vim/plugged/YouCompleteMe"))
	" Python Semantic Completion
	"let g:ycm_python_binary_path = '/usr/bin/python3'

	" 寻找全局配置文件
	"let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'
	"let g:ycm_global_ycm_extra_conf = '~/.vim/plugged/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
	let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'

	" 禁用syntastic来对python检查
	let g:syntastic_ignore_files=[".*\.py$"]

	" 使用ctags生成的tags文件，开启YCM基于标签引擎
	let g:ycm_collect_identifiers_from_tags_files = 1

	" 语法关键字补全
	let g:ycm_seed_identifiers_with_syntax = 1
	" 在接受补全后不分裂出一个窗口显示接受的项
	set completeopt-=preview
	" 让补全行为与一般的IDE一致
	set completeopt=longest,menu
	" 不显示开启vim时检查ycm_extra_conf文件的信息
	"let g:ycm_confirm_extra_conf=0
	let g:ycm_confirm_extra_conf=1
	" 每次重新生成匹配项，禁止缓存匹配项
	let g:ycm_cache_omnifunc=0
	" 在注释中也可以补全
	let g:ycm_complete_in_comments=1
	" 在字符串输入中也能补全
	let g:ycm_complete_in_strings = 1
	" 注释和字符串中的文字也会被收入补全
	let g:ycm_collect_identifiers_from_comments_and_strings = 1
	" 从第2个键入字符就开始罗列匹配项
	let g:ycm_min_num_of_chars_for_completion=2
	" 错误标识符
	let g:ycm_error_symbol='>>'
	" 警告标识符
	let g:ycm_warning_symbol='>*'
	" 不查询ultisnips提供的代码模板补全，如果需要，设置成1即可
	let g:ycm_use_ultisnips_completer=1

	" 设置转到定义处的快捷键为ALT+G，未测出效果
	"nmap <M-g> :YcmCompleter GoToDefinitionElseDeclaration <C-R>=expand("<cword>")<CR><CR>
	" 跳转快捷键
	"nnoremap <c-k> :YcmCompleter GoToDeclaration<CR>
	"nnoremap <c-h> :YcmCompleter GoToDefinition<CR>
	"nnoremap <c-j> :YcmCompleter GoToDefinitionElseDeclaration<CR>

	" 弹出列表时选择第1项的快捷键(默认为<TAB>和<Down>)
	"let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
	" 弹出列表时选择前1项的快捷键(默认为<S-TAB>和<UP>)
	"let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
	" 主动补全, 默认为<C-Space>
	"let g:ycm_key_invoke_completion = ['<C-Space>']
	" 停止显示补全列表(防止列表影响视野), 可以按<C-Space>重新弹出
	"let g:ycm_key_list_stop_completion = ['<C-y>']

endif

" --------------------------------------------------------}}}2

" ========================================================}}}1

" VIM CUSTOM SHORTCUT KEY SETTINGS:
" Vim自定义热键设置

" ========================================================{{{1

" Set mapleader
" --------------------------------------------------------{{{2
" 设置map leader键
let mapleader=","

" --------------------------------------------------------}}}2
" Space to command mode.
" --------------------------------------------------------{{{2
" 将'空格'映射为':',通过空格进入命令模式
nnoremap <space> :
vnoremap <space> :

" --------------------------------------------------------}}}2
" Switching between buffers.
" --------------------------------------------------------{{{2
" 设置切换窗口的快捷键，我还是不习惯于这么切换，注释掉
"nnoremap <C-h> <C-W>h
"nnoremap <C-j> <C-W>j
"nnoremap <C-k> <C-W>k
"nnoremap <C-l> <C-W>l


" --------------------------------------------------------}}}2
" <F9><F10><F12>快捷键依赖的运行shell脚本的函数
" --------------------------------------------------------{{{2
function! RunShell(Msg, Shell)
    echo a:Msg . '...'
    call system(a:Shell)
    echon ' [Done]'
endfunction

" --------------------------------------------------------}}}2
" <F6>快捷键依赖的运行vimscript脚本的函数
" --------------------------------------------------------{{{2
let s:f6_flag=0
let s:f7_flag=0
function F6_shell()
	if (s:f6_flag == 0)
		set paste
		set nonumber
		if (s:f7_flag == 1)
			set foldcolumn=0
			set foldmethod=marker
		endif
		let s:f6_flag=1
	else
		set nopaste
		set number
		if (s:f7_flag == 1)
			set foldcolumn=5
			set foldmethod=indent
		endif
		let s:f6_flag=0
	endif
endfunction


" --------------------------------------------------------}}}2
" <F7>快捷键依赖的运行vimscript脚本的函数
" --------------------------------------------------------{{{2
function F7_shell()
	if (s:f7_flag == 0)
		set foldcolumn=5
		set foldmethod=indent
		let s:f7_flag=1
	else
		set foldcolumn=0
		set foldmethod=marker
		let s:f7_flag=0
	endif
endfunction

" --------------------------------------------------------}}}2
" <Fx>类型快捷键总设置
" --------------------------------------------------------{{{2
" <F2> vim help 窗口
" <F2> tagbar   窗口
" <F3> 文件浏览 窗口
" <F4> 语法检查，并提示
" <F6> 粘贴模式
" <F7> 切换代码折叠方式（maker改为indent）
" <F9> 生成tags数据库文件。之后就可以使用ctrl+] 和 ctrl+o(或者ctrl+t)
" <F10> 以绝对路径在当前目录下，生成cscope数据库文件<目录名.out>
" <F12> 生成cscope.out数据库文件
nnoremap <silent> <F2> :TagbarToggle<CR>
nnoremap <silent> <F3> :NERDTreeToggle<cr>
"nnoremap <silent> <F4> :ALEToggle<cr>
if has('python2') " only python2
	nnoremap <silent> <F5> :ConqueTermSplit bash<cr>
else
	if has('terminal')
		nnoremap <silent> <F5> :terminal<cr>
	else
		nnoremap <silent> <F5> :echomsg 'not support \<F5\> keymap'<cr>
	endif
endif
nnoremap <silent> <F6> :call F6_shell()<cr>
nnoremap <silent> <F7> :call F7_shell()<cr>
nnoremap <silent> <F9> :call RunShell("Generate tags", "ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .")<cr>
nnoremap <silent> <F12> :call RunShell("Generate cscope.out", "bash ~/.vim/shell/create_cscope.sh")<cr>
"nnoremap <silent> <F12> :call RunShell("Generate cscope.out", "cscope -Rb")<cr>:cs add cscope.out<cr>

" --------------------------------------------------------}}}2
"  cscope settings
" --------------------------------------------------------{{{2
"
" cscope命令说明：
" cscope add cscope.out --- 添加cscope.out文件
" cscope find s --- 查找C语言符号，即查找函数名、宏、枚举值等出现的地方
" cscope find g --- 查找函数、宏、枚举等定义的位置，类似ctags所提供的功能
" cscope find d --- 查找本函数调用的函数
" cscope find c --- 查找调用本函数的函数
" cscope find t --- 查找指定的字符串
" cscope find e --- 查找egrep模式，相当于egrep功能，但查找速度快多了
" cscope find f --- 查找并打开文件，类似vim的功能
" cscope find i --- 查找包含本文件的文件
"
"	USAGE	:cs add {file|dir} [pre-path] [flags]
"
"	USAGE	:cs find {querytype} {name}
"		0 or s: Find this C symbol
"		1 or g: Find this definition
"		2 or d: Find functions called by this function
"		3 or c: Find functions calling this function
"		4 or t: Find this text string
"		6 or e: Find this egrep pattern
"		7 or f: Find this file
"		8 or i: Find files #including this file
"
nnoremap <silent> <leader>sw :cs show<cr>
nnoremap <silent> <leader>ss :cs find s <C-R>=expand("<cword>")<cr><cr>
nnoremap <silent> <leader>sg :cs find g <C-R>=expand("<cword>")<cr><cr>
nnoremap <silent> <leader>sd :cs find d <C-R>=expand("<cword>")<cr><cr>
nnoremap <silent> <leader>sc :cs find c <C-R>=expand("<cword>")<cr><cr>
nnoremap <silent> <leader>st :cs find t <C-R>=expand("<cword>")<cr><cr>
nnoremap <silent> <leader>se :cs find e <C-R>=expand("<cword>")<cr><cr>
nnoremap <silent> <leader>sf :cs find f <C-R>=expand("<cfile>")<cr><cr>
nnoremap <silent> <leader>si :cs find i <C-R>=expand("<cfile>")<cr><cr>

" --------------------------------------------------------}}}2
" 标签页快捷键
" --------------------------------------------------------{{{2
",c 创建新标签
",x 删除标签
",[ 移动到前一个标签
",] 移动到下一个标签
nnoremap <silent> <leader>c :tabnew<cr>
nnoremap <silent> <leader>x :tabclose<cr>
nnoremap <silent> <leader>] :tabn<cr>
nnoremap <silent> <leader>[ :tabp<cr>

" choosewin keymap
"	| Key  | Action     | Description                   |
"	| ---- | ---------- | ----------------------------- |
"	| 0    | tab_first  | Select FIRST    tab           |
"	| [    | tab_prev   | Select PREVIOUS tab           |
"	| ]    | tab_next   | Select NEXT     tab           |
"	| $    | tab_last   | Select LAST     tab           |
"	| x    | tab_close  | Close current tab             |
"	| ;    | win_land   | Navigate to current window    |
"	| -    | previous   | Naviage to previous window    |
"	| s    | swap       | Swap windows               #1 |
"	| S    | swap_stay  | Swap windows but stay      #1 |
"	| <CR> | win_land   | Navigate to current window    |
"	|      | <NOP>      | Disable predefined keymap     |
if isdirectory(expand("~/.vim/plugged/vim-choosewin"))
	" invoke with '-'
	"nmap  -  <Plug>(choosewin)
	nnoremap <silent> <F4> :ChooseWin<cr>
	" if you want to use overlay feature
	let g:choosewin_overlay_enable = 1
endif

" --------------------------------------------------------}}}2

" ========================================================}}}1

" AUTO INSERT FILE HERDER:
" 自动插入文件头:

" ========================================================{{{1

" 当打开*.c,*.cpp,*.sh,*.py,*.java文件时，执行SetTitle函数
autocmd BufNewFile *.c,*.cpp,*.sh,*.py,*.java exec ":call SetTitle()"

"定义函数SetTitle，自动插入文件头
func SetTitle()
	"如果文件类型为.c或者.cpp文件
	if (&filetype == 'c' || &filetype == 'cpp')
		call setline(1, "/*************************************************************************")
		call setline(2, "\ @Author: wanghan")
		call setline(3, "\ @Created Time : ".strftime("%c"))
		call setline(4, "\ @File Name: ".expand("%"))
		call setline(5, "\ @Description:")
		call setline(6, " ************************************************************************/")
		call setline(7,"")
	endif
	"如果文件类型为.sh文件
	if &filetype == 'sh'
		call setline(1, "\#!/bin/bash")
		call setline(2, "\# Author: wanghan")
		call setline(3, "\# Created Time : ".strftime("%c"))
		call setline(4, "\# File Name: ".expand("%"))
		call setline(5, "\# Description:")
		call setline(6,"")
	endif
	"如果文件类型为.py文件
	if &filetype == 'python'
		call setline(1, "\#!/usr/bin/env python")
		call setline(2, "\# -*- coding=utf8 -*-")
		call setline(3, "\"\"\"")
		call setline(4, "\# Author: wanghan")
		call setline(5, "\# Created Time : ".strftime("%c"))
		call setline(6, "\# File Name: ".expand("%"))
		call setline(7, "\# Description:")
		call setline(8, "\"\"\"")
		call setline(9,"")
	endif
	"如果文件类型为.java文件
	if &filetype == 'java'
		call setline(1, "//coding=utf8")
		call setline(2, "/**")
		call setline(3, "\ *\ @Author: wanghan")
		call setline(4, "\ *\ @Created Time : ".strftime("%c"))
		call setline(5, "\ *\ @File Name: ".expand("%"))
		call setline(6, "\ *\ @Description:")
		call setline(7, "\ */")
		call setline(8,"")
	endif
endfunc

" 自动将光标定位到末尾
autocmd BufNewFile * normal G

" ========================================================
" THE END }}}1

