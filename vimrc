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
set autoindent		" 创建新行自动缩进
set cindent			" 开启针对c文件的缩进
set smartindent	    " 开启智能缩进，它不像cindent那样完美支持c文件的缩进，但对于未知类型文件的缩进，还是有帮助的
set autoread		" 文件在Vim之外修改过，自动重新读入
set autowrite
set backspace=indent,eol,start
set cinoptions=:0
set cursorline		" 为光标所在行加下划线
set completeopt=longest,menuone
set fileencodings=utf-8,gb2312,gbk,gb18030 " 使用utf-8或gbk等编码打开文件
set fileformat=unix
set foldenable
set foldmethod=marker	" 代码折叠(标签折叠方式)
"set foldmethod=indent	" 代码折叠（缩进折叠方式）
"set foldmethod=syntax	" 代码折叠（语法折叠方式）
set foldcolumn=0		" 每行前面有0个折叠标识列
set helpheight=10
set helplang=cn       " 帮助系统设置为中文
set hidden
set history=1000      " 历史记录保留1000条
set hlsearch
set ignorecase        " 检索时忽略大小写
set incsearch
set laststatus=2      " 指定何时显示状态行
"                          " 0 永远没有
"                          " 1 只有分割窗口时(默认值)
"                          " 2 总是存在
set mouse=a         " 可以使用鼠标
set number          " 显示行号
set pumheight=10
set ruler           "显示状态栏
set scrolloff=5
set showcmd
set smartcase
set tabstop=4       " 制表符为4
set noexpandtab     " 不把制表符替换为空格
"set expandtab       " 制表符替换为空格
set shiftwidth=0    "换行时使用0个空格，使用tab键风格时如此设置
"set shiftwidth=4    "换行时使用4个空格
set termencoding=utf-8
set wildmenu
set wildmode=list:longest,full
set nowrap          " 禁止文字自动换行
"set textwidth=256   " 超过256个字符自动换行
set t_Co=256        "开启256颜色
set nobackup
set noswapfile      " 不使用swapfile文件（不能灾难恢复）

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


" --------------------------------------------------------}}}2
" UI插件
" --------------------------------------------------------{{{2

" vim start panel
Plug 'mhinz/vim-startify'

" vim theme
Plug 'flazz/vim-colorschemes'

" vim文字和背景配色
Plug 'altercation/vim-colors-solarized'

" airline 状态栏插件
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" --------------------------------------------------------}}}2
" 直接加载的插件
" --------------------------------------------------------{{{2

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
" 简化写法省略前面的github网址前缀，当然全写也是OK的

" 格式化对齐，代码中的等号
"Plug 'junegunn/vim-easy-align' " 有趣，但是非高频使用，暂时注释掉

" highlight current word
Plug 'dominikduda/vim_current_word'

" 彩虹括号
Plug 'luochen1990/rainbow'

" 输入时自动配对括号
Plug 'jiangmiao/auto-pairs'

" vim中的git插件
Plug 'tpope/vim-fugitive'

" markdown
Plug 'plasticboy/vim-markdown'

" AutoComplPop 是按字典进行补全的，只有你输入过的单词才可以补全
" 默认只有输入两个字符，才会提示
" vim输入时自动补全提示 比较古老，暂无好的替代品
Plug 'eikenb/acp'

" ctags管理
Plug 'ludovicchabant/vim-gutentags'

" 代码自动补全插件
Plug 'Shougo/neocomplete.vim'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'honza/vim-snippets'

" C++代码补全，比较古老，不是很好用
"Plug 'vim-scripts/OmniCppComplete'

"" Go Lang 插件
"Plug 'fatih/vim-go'
"
"" Python 插件
"Plug 'klen/python-mode'
"Plug 'yssource/python.vim'
"Plug 'vim-scripts/python_match.vim'
"Plug 'vim-scripts/pythoncomplete'
"
"" Disable if python support not present
"if !has('python') && !has('python3')
"	let g:pymode = 0
"endif
"
"if isdirectory(expand("~/.vim/plugged/python-mode"))
"	let g:pymode_lint_checkers = ['pyflakes']
"	let g:pymode_trim_whitespaces = 0
"	let g:pymode_options = 0
"	let g:pymode_rope = 0
"endif

" vim 字典仓库
"Plug 'asins/vim-dict'
Plug 'skywind3000/vim-dict'

" 语法检查，需配合相应的语法检查器
"Plug 'vim-syntastic/syntastic'

" ctrlp快速搜索文件并打开
"Plug 'kien/ctrlp.vim' " 有用，但是非高频使用注释掉

" vimcdoc中文vim文档
Plug 'yianwillis/vimcdoc'

" --------------------------------------------------------}}}2
" 延迟按需加载，使用到命令的时候再加载的插件
" --------------------------------------------------------{{{2

" On-demand loading

" 浏览文件的插件
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" 代码速览插件(用tagbar替代了taglist)
Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }

" 异步检查vim中的语法问题并提示
Plug 'w0rp/ale', { 'on': 'ALEToggle' }

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

" background
" --------------------------------------------------------{{{2
if has('gui_running')
	set background=light " 配色主题的色系设置为light
else
	set background=dark  " 配色主题的色系设置为dark
endif

" --------------------------------------------------------}}}2
" vim startify
" --------------------------------------------------------{{{2
"自定义Header和Footer
"let g:startify_custom_header = [
"            \ '    .___        __          .__                             _____.__        ',
"            \ '  __| _/_______/  |_  ___  _|__| _____   ____  ____   _____/ ____\__| ____  ',
"            \ ' / __ |/  ___/\   __\ \  \/ /  |/     \_/ ___\/  _ \ /    \   __\|  |/ ___\ ',
"            \ '/ /_/ |\___ \  |  |    \   /|  |  Y Y  \  \__(  <_> )   |  \  |  |  / /_/  >',
"            \ '\____ /____  > |__|     \_/ |__|__|_|  /\___  >____/|___|  /__|  |__\___  / ',
"            \ '     \/    \/                        \/     \/           \/        /_____/  ',
"            \ '                    +------------------------------+',
"            \ '                    |         dst vimconfig        |',
"            \ '                    +------------------------------+',
"            \ '                    | <F1> vim help 窗口           |',
"            \ '                    | <F2> tagbar   窗口           |',
"            \ '                    | <F3> 文件浏览 窗口           |',
"            \ '                    | <F4> 语法检查                |',
"            \ '                    | <F6> 粘贴模式                |',
"            \ '                    | <F7> 代码折叠                |',
"            \ '                    | <F9> 生成tags                |',
"            \ '                    | <F12> 生成cscope.out         |',
"            \ '                    +------------------------------+',
"            \]

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
            \ '                        +------------------------------+',
            \ '                        |         dst vimconfig        |',
            \ '                        +------------------------------+',
            \ '                        | <F1> vim help 窗口           |',
            \ '                        | <F2> tagbar   窗口           |',
            \ '                        | <F3> 文件浏览 窗口           |',
            \ '                        | <F4> 语法检查                |',
            \ '                        | <F6> 粘贴模式                |',
            \ '                        | <F7> 代码折叠                |',
            \ '                        | <F9> 生成tags                |',
            \ '                        | <F12> 生成cscope.out         |',
            \ '                        +------------------------------+',
            \]

"let g:startify_custom_footer = [
"            \ '+------------------------------+',
"            \ '|          Keep Codeing        |',
"            \ '+------------------------------+',
"            \]

" --------------------------------------------------------}}}2
" vim-colors-solarized插件
" --------------------------------------------------------{{{2
" 开启solarized
let g:solarized_termcolors=256
colorscheme solarized

" --------------------------------------------------------}}}2
" 配置airline，美化状态栏和顶部tab
" --------------------------------------------------------{{{2

" ~/.vim/plugged/vim-airline-themes/autoload/airline/路径下可以查看配色
"let g:airline_theme='solarized'   " airline配色
"let g:airline_theme='term_light'  " airline配色
"let g:airline_theme='biogoo'      " airline配色
let g:airline_theme='powerlineish'

let g:airline#extensions#tabline#enabled = 1 "顶部tab显示"
let g:airline#extensions#tabline#buffer_nr_show = 1
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
"autocmd FileType c setlocal tags+=~/.cache/tags/libc.tags
"autocmd FileType cpp setlocal tags+=~/.cache/tags/libc.tags
"autocmd FileType cpp setlocal tags+=~/.cache/tags/libcxx.tags
"autocmd FileType go setlocal tags+=~/.cache/tags/go.tags
"autocmd FileType go setlocal tags+=~/.cache/tags/data-wanghan-work-aosp-j6b2r-build-soong-.tags
set tags+=./.tags;,.tags

" --------------------------------------------------------}}}2
"  Gtags
" --------------------------------------------------------{{{2
"let $GTAGSLABEL = 'native-pygments'
"let $GTAGSCONF = '/path/to/share/gtags/gtags.conf'

" --------------------------------------------------------}}}2
" gutentags 插件设置
" --------------------------------------------------------{{{2
" gutentags 搜索工程目录的标志，当前文件路径向上递归直到碰到这些文件/目录名
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']

" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'

" 同时开启 ctags 和 gtags 支持：
let g:gutentags_modules = []
if executable('ctags')
	let g:gutentags_modules += ['ctags']
endif
if executable('gtags-cscope') && executable('gtags')
	let g:gutentags_modules += ['gtags_cscope']
endif

" 将自动生成的 ctags/gtags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let g:gutentags_cache_dir = expand('~/.cache/tags')

" 配置 ctags 的参数，老的 Exuberant-ctags 不能有 --extra=+q，注意
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" 如果使用 universal ctags 需要增加下面一行，老的 Exuberant-ctags 不能加下一行
let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']

" 禁用 gutentags 自动加载 gtags 数据库的行为
let g:gutentags_auto_add_gtags_cscope = 0

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

"let g:vim_markdown_folding_disabled = 1 "禁用代码折叠
"set [no]foldenable "vim自带的折叠功能是否开启

"autocmd BufNewFile,BufReadPost *.md set filetype=markdown
"let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']
"let g:markdown_syntax_conceal = 0 "关闭Markdown语法高亮
"let g:markdown_minlines = 100 "支持100行显示（默认50行），开启后可能会卡

" --------------------------------------------------------}}}2
" 配置vim_current_word，自动高亮光标选中的单词
" --------------------------------------------------------{{{2

let g:vim_current_word#enabled = 1 "打开vim_current_word插件
"let g:vim_current_word#highlight_twins = 1 "高亮相似的词
let g:vim_current_word#highlight_current_word = 1 "高亮选中的单词
"let g:vim_current_word#highlight_delay = 1000 "延时1000ms再highlight
"let g:vim_current_word#highlight_only_in_focused_window = 1 "只高亮当前聚焦窗口

" --------------------------------------------------------}}}2
" 配置rainbow插件，显示彩色的括号
" --------------------------------------------------------{{{2
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

" --------------------------------------------------------}}}2
" 配置NERDTree插件
" --------------------------------------------------------{{{2
"let Tlist_Show_One_File=1      " 打开文件时默认打开NERDTree
"let g:NERDTreeWinPos="right"   " 在右侧打NERDTree
"let g:NERDTreeWinSize=25       " 宽度设置为25个字符
"let g:NERDTreeShowLineNumbers=1" 显示行号
"let g:NERDTreeQuitOnOpen=1     " 打开文件时关闭NERDTree

"--------------------------------------------------------}}}2
" 配置CrtlP插件
" --------------------------------------------------------{{{2
"let g:ctrlp_map = '<c-p>'
"let g:ctrlp_cmd = 'CtrlP'
"
"set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
"set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
"
"let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
"let g:ctrlp_custom_ignore = {
"  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
"  \ 'file': '\v\.(exe|so|dll)$',
"  \ 'link': 'some_bad_symbolic_links',
"  \ }

" --------------------------------------------------------}}}2
" 配置OmniCppComplete插件
" --------------------------------------------------------{{{2
"let g:OmniCpp_DefaultNamespaces=["std"]
"let g:OmniCpp_MayCompleteScope=1
"let g:OmniCpp_SelectFirstItem=2
" 生成标签文件命令
" 	ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .
" 在对C++文件进行补全时，OmniCppComplete插件需要tag文件中包含C++的额外信息，因此上面的ctags命令不同于以前我们所使用的，它专门为C++语言生成一些额外的信息，上述选项的含义如下：
" 	--c++-kinds=+p : 为C++文件增加函数原型的标签
" 	--fields=+iaS : 在标签文件中加入继承信息(i)、类成员的访问控制信息(a)、以及函数的指纹(S)
" 	--extra=+q : 为标签增加类修饰符。注意，如果没有此选项，将不能对类成员补全

" --------------------------------------------------------}}}2
" 配置neocomplete 补全插件，不支持Vim8.2以上，新版本推荐deoplete.nvim
" --------------------------------------------------------{{{2

let g:acp_enableAtStartup = 0 " 禁用acp(AutoComplPop)
let g:neocomplete#enable_at_startup = 1 " 打开neocomplete
let g:neocomplete#enable_smart_case = 1 " 智能大小写
let g:neocomplete#enable_auto_delimiter = 1 " 自动分隔符
let g:neocomplete#max_list = 15 " 下拉菜单最多15行
let g:neocomplete#force_overwrite_completefunc = 1 " 强制覆盖completefunc

" Define dictionary. 定义字典
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
    \ }

" Define keyword. 定义关键字
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" complete-key-map-setting 
" --------------------------------------------------------
" <C-k> Complete Snippet
" <C-k> Jump to next snippet point
imap <silent><expr><C-k> neosnippet#expandable() ?
            \ "\<Plug>(neosnippet_expand_or_jump)" : (pumvisible() ?
            \ "\<C-e>" : "\<Plug>(neosnippet_expand_or_jump)")
smap <TAB> <Right><Plug>(neosnippet_jump_or_expand)

inoremap <expr><C-g> neocomplete#undo_completion()
inoremap <expr><C-l> neocomplete#complete_common_string()
"inoremap <expr><CR> neocomplete#complete_common_string()

" <CR>: close popup
" <s-CR>: close popup and save indent.
inoremap <expr><s-CR> pumvisible() ? neocomplete#smart_close_popup()."\<CR>" : "\<CR>"

function! CleverCr()
    if pumvisible()
        if neosnippet#expandable()
            let exp = "\<Plug>(neosnippet_expand)"
            return exp . neocomplete#smart_close_popup()
        else
            return neocomplete#smart_close_popup()
        endif
    else
        return "\<CR>"
    endif
endfunction

" <CR> close popup and save indent or expand snippet
imap <expr> <CR> CleverCr()
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y> neocomplete#smart_close_popup()
" <TAB>: completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<TAB>"

" Courtesy of Matteo Cavalleri

function! CleverTab()
    if pumvisible()
        return "\<C-n>"
    endif
    let substr = strpart(getline('.'), 0, col('.') - 1)
    let substr = matchstr(substr, '[^ \t]*$')
    if strlen(substr) == 0
        " nothing to match on empty string
        return "\<Tab>"
    else
        " existing text matching
        if neosnippet#expandable_or_jumpable()
            return "\<Plug>(neosnippet_expand_or_jump)"
        else
            return neocomplete#start_manual_complete()
        endif
    endif
endfunction

imap <expr> <Tab> CleverTab()
" --------------------------------------------------------

" Enable heavy omni completion.
" 启用笨重的omni补全
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.ruby = '[^. *\t]\.\h\w*\|\h\w*::'

" Enable omni completion. 启用omni补全
"autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
"autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
"autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
"autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
"autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
"autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

" --------------------------------------------------------}}}2
" 配置snippets 设置
" --------------------------------------------------------{{{2
" Use honza's snippets.
let g:neosnippet#snippets_directory='~/.vim/plugged/vim-snippets/snippets'

" Enable neosnippet snipmate compatibility mode
let g:neosnippet#enable_snipmate_compatibility = 1

" For snippet_complete marker.
if !exists("g:spf13_no_conceal")
    if has('conceal')
        set conceallevel=2 concealcursor=i
    endif
endif

" Enable neosnippets when using go
let g:go_snippet_engine = "neosnippet"

" Disable the neosnippet preview candidate window
" When enabled, there can be too much visual noise
" especially when splits are used.
set completeopt-=preview

" --------------------------------------------------------}}}2
" 配置synatastic 语法检查设置
" --------------------------------------------------------{{{2
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0


" --------------------------------------------------------}}}2
" 配置Man.vim Man手册
" --------------------------------------------------------{{{2
source $VIMRUNTIME/ftplugin/man.vim

" --------------------------------------------------------}}}2
" 配置auto-pairs插件 括号自动补全()[]{}
" --------------------------------------------------------{{{2

" --------------------------------------------------------}}}2
" 设定中文doc帮助文档目录
" --------------------------------------------------------{{{2
"let helptags="$VIM/bundle/vimcdoc/doc"
"set helplang=cn "设定帮助系统设置为中文
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
nmap  <F2> :TagbarToggle<cr>
nmap  <F3> :NERDTreeToggle<cr>
nmap  <F4> :ALEToggle<cr>
nmap  <F6> :call F6_shell()<cr>
nmap  <F7> :call F7_shell()<cr>
nmap  <F9> :call RunShell("Generate tags", "ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .")<cr>
"nmap <F10> :call RunShell("本地生成cscope文件", "bash ~/.vim/shell/create_cscope.sh")<cr>
nmap <F12> :call RunShell("Generate cscope", "cscope -Rb")<cr>:cs add cscope.out<cr>

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
nmap <leader>sa :cs add cscope.out<cr>
nmap <leader>ss :cs find s <C-R>=expand("<cword>")<cr><cr>
nmap <leader>sg :cs find g <C-R>=expand("<cword>")<cr><cr>
nmap <leader>sd :cs find d <C-R>=expand("<cword>")<cr><cr>
nmap <leader>sc :cs find c <C-R>=expand("<cword>")<cr><cr>
nmap <leader>st :cs find t <C-R>=expand("<cword>")<cr><cr>
nmap <leader>se :cs find e <C-R>=expand("<cword>")<cr><cr>
nmap <leader>sf :cs find f <C-R>=expand("<cfile>")<cr><cr>
nmap <leader>si :cs find i <C-R>=expand("<cfile>")<cr><cr>

" --------------------------------------------------------}}}2
" 标签页快捷键
" --------------------------------------------------------{{{2
",c 创建新标签
",x 删除标签
",[ 移动到前一个标签
",] 移动到下一个标签
nmap <leader>c :tabnew<cr>
nmap <leader>x :tabclose<cr>
nmap <leader>] :tabn<cr>
nmap <leader>[ :tabp<cr>
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

