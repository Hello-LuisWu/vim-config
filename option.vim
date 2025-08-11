" ------------------------------------------------------------------------------
" Author   : Luis Wu
" Editor   : Neovim
" Date     : 2025-08-11 14:36
" Position : /Users/luis/.config/vimrc/option.vim
" System   : Darwin 24.3.0
" ------------------------------------------------------------------------------

" vim 默认配置文件路径：/etc/vim/vimrc; /usr/share/vim/vimrc
" more color: https://www.ditig.com/publications/256-colors-cheat-sheet

" ========== 基础设置 ==========
set nocompatible " 禁用 Vi 兼容模式（确保使用 Vim 的全部功能）
" 字符编码
set encoding=utf-8 " Vim 内部编码,  如字符编码格式,如buffer、寄存器、Vim 脚本文件等
set fileencoding=utf-8 " 写入文件使用的编码
" 尝试读取文件时的编码顺序
set fileencodings=
	\utf-8,
	\ucs-bom,
	\gb18030,
	\gbk,gb2312,
	\cp936

set termencoding=utf-8
" 非所有 Vim 都编译支持中文菜单，加上判断防止报错
if exists('+langmenu')
  set langmenu=zh_CN.UTF-8
endif
set helplang=cn " 查询帮助显示的语言
" set backspace=2 " 让 backspace 生效.不加参数则只能删除新添加的内容
set backspace=
	\indent,
	\eol,
	\start

" 文件备份
set nobackup " 禁止生成临时备份文件
set noswapfile " 不创建swap 临时交换文件
set nowritebackup " 编辑时不需要备份文件
set noundofile " 不创建撤销文件
" 如果启用备份，指定备份目录（确保目录存在）需手动创建目录 mkdir -p ~/.vim/tmp/{backup,swap,undo}
" set backupdir=~/.vim/tmp/backup//
" set directory=~/.vim/tmp/swap//
" set undodir=~/.vim/tmp/undo//

"设置以unix的格式保存文件（Unix换行符）
set fileformat=unix
set fileformats=
	\unix,
	\dos,
	\mac

" 历史记录
set history=1000  " 命令历史记录数
set undolevels=1000  " 撤销历史深度
set undoreload=10000  " 重新载入文件时保留的撤销历史条目


" ========== 显示与界面 ==========

set noeb  " 关闭光标闪烁

" 使用 24-bit 真色彩模式
if has('termguicolors')
  set termguicolors
endif

set signcolumn=yes " 始终显示 signcolumn （侧边提示栏），避免诊断信息出现/消失时文字位置跳动

" 折叠设置
set foldcolumn=2 " 打开折叠边栏
set foldenable        " 启用折叠
set foldlevel=99       " 默认不折叠
set foldmethod=marker   " 对文中的标志折叠,如: {{{....}}}
"{{{
" 6种折叠方式:
" manual           " 手工定义折叠
" indent           " 基于缩进的折叠,更多的缩进表示更高级别的折叠
" expr             " 用表达式来定义折叠
" syntax           " 用语法高亮来定义折叠
" diff             " 对没有更改的文本进行折叠
" marker           " 对文中的标志折叠,如: {{{....}}}
"}}}

" 开启语法高亮
syntax on

" 主题设置（需要提前安装主题插件，如 gruvbox）
colorscheme gruvbox
set background=dark " 背景颜色为黑色

" 行设置
set numberwidth=4 " 行号列宽度
set number " 开启行号
set relativenumber " 开启相对行号
set ruler           " 显示光标位置（行列百分比）
set linebreak " 不在单词内部换行
set nowrap " 禁止换行
set textwidth=80    " 行宽限制（按需启用）
" 对齐线,可用逗号添加多个对齐线,用于对齐文本。将使屏幕重绘速度变慢。屏幕列可以是一个绝对数字，也可以是前面带 + 或 -
" set colorcolumn=+1,+2,+3,-22,33

" set cursorcolumn " 高亮当前列
set cursorline " 突出显示光标所在行（默认样式是underline）
set confirm " 处理未保存或只读文件的时候，弹出确认
set noshowmode " 在底部显示当前模式
set showcmd " 显示输入的命令和可视模式下显示选中的行数 (默认)
" 获取当前路径，将$HOME转化为~
function! CurDir()
	let curdir = substitute(getcwd(), $HOME, "~", "g")
	return curdir
endfunction

" 光标在 normol 模式下,可以定位到最后一个字的后面
set virtualedit=
	\block,
	\onemore

set laststatus=2 " 显示状态行，值为 0 不显示，值为 1 当有多个窗口才显示，值为2 永久显示

let g:currentmode={
	\ 'n'  : 'Normal',
	\ 'v'  : 'Visual',
	\ 'V'  : 'V·Line',
	\ "\<C-V>" : 'V·block',
	\ 'i'  : 'Insert',
	\ 'R'  : 'Replace',
	\ 'Rv' : 'V·Replace',
	\ 'c'  : 'Command',
\}



let g:status_colors = {
	\ 'L_mode_fg':      '#333333',
	\ 'L_mode_bg':      '#bb7662',
	\ 'R_char_fg':      '#1b1447',
	\ 'R_char_bg':      '#978771',
	\ 'Both2_fg':       '#b6b136',
	\ 'Both2_bg':       '#5c503f',
	\ 'Center_fg':      '#94846f',
	\ 'Center_bg':      '#493820',
\ }

let g:status_cterm_colors = {
	\ 'L_mode_fg':      236,
	\ 'L_mode_bg':      173,
	\ 'R_char_fg':      17,
	\ 'R_char_bg':      144,
	\ 'Both2_fg':       142,
	\ 'Both2_bg':       59,
	\ 'Center_fg':      101,
	\ 'Center_bg':      52,
	\ 'cterm':          "bold",
\ }

execute 'highlight StatusLmode cterm=bold'
	\ . ' guifg=' . g:status_colors.L_mode_fg
	\ . ' guibg=' . g:status_colors.L_mode_bg
	\ . ' ctermfg=' . g:status_cterm_colors.L_mode_fg
	\ . ' ctermbg=' . g:status_cterm_colors.L_mode_bg

execute 'highlight StatusLmodeIcon'
	\ . ' guifg=' . g:status_colors.L_mode_bg
	\ . ' guibg=' . g:status_colors.Both2_bg

execute 'highlight StatusBoth2'
	\ . ' guifg=' . g:status_colors.Both2_fg
	\ . ' guibg=' . g:status_colors.Both2_bg
	\ . ' ctermfg=' . g:status_cterm_colors.Both2_fg
	\ . ' ctermbg=' . g:status_cterm_colors.Both2_bg

execute 'highlight StatusBoth2Icon'
	\ . ' guifg=' . g:status_colors.Both2_bg
	\ . ' guibg=' . g:status_colors.Center_bg

execute 'highlight StatusCenter'
	\ . ' guifg=' . g:status_colors.Center_fg
	\ . ' guibg=' . g:status_colors.Center_bg
	\ . ' ctermfg=' . g:status_cterm_colors.Center_fg
	\ . ' ctermbg=' . g:status_cterm_colors.Center_bg

execute 'highlight StatusChar'
	\ . ' cterm=' . g:status_cterm_colors.cterm
	\ . ' guifg=' . g:status_colors.R_char_fg
	\ . ' guibg=' . g:status_colors.R_char_bg
	\ . ' ctermfg=' . g:status_cterm_colors.R_char_fg
	\ . ' ctermbg=' . g:status_cterm_colors.R_char_bg


execute 'highlight StatusCharIcon'
	\ . ' guifg=' . g:status_colors.R_char_bg
	\ . ' guibg=' . g:status_colors.Both2_bg

" 检查插件函数是否存在，并处理空分支名
function! GitBranchStatus() abort
  if exists('*gitbranch#name')  " 确保插件已加载
    let l:branch = gitbranch#name()
    if !empty(l:branch)         " 确保分支名非空
      return ' ' . l:branch
    endif
  endif
  return ''  " 所有异常情况返回空字符串
endfunction

let g:statuslineIcon = {
	\ 'LeftIcon':    '',
	\ 'RightIcon':   '',
	\ 'LeftIcon2':   '',
	\ 'RightIcon2':  '',
\}

set statusline+=%#StatusLmode#\ %{(g:currentmode[mode()])}\            " 模式
set statusline+=%#StatusLmodeIcon#%{(g:statuslineIcon.LeftIcon)}  " 分隔图标
" set statusline+=%#StatusBoth2#\ \ %{gitbranch#name()}\                " Git 分支名称
set statusline+=%#StatusBoth2#\ %{GitBranchStatus()}                " Git 分支名称
set statusline+=\ %{&readonly?'[x]':'[v]'}\    " 显示只读字符为 No-edit
set statusline+=%#StatusBoth2Icon#%{(g:statuslineIcon.LeftIcon)}  " 分隔图标
set statusline+=%#StatusCenter#\ %t\                " 当前文件名
set statusline+=%m                 " 修改标志 [+] 表示修改未保存
set statusline+=%=                        " 左右分界线
set statusline+=\ %l/%L\ %p%%\       " 当前行号:列号
set statusline+=%#StatusBoth2Icon#%{(g:statuslineIcon.RightIcon)}   " 分隔图标
set statusline+=%#StatusBoth2#\ %{&fileencoding}\    " 文件编码
set statusline+=%#StatusBoth2#\ %{&fileencoding}\    " 文件编码
set statusline+=%{&fileformat}\       " 换行符格式（unix/dos）
set statusline+=%{&filetype}\             " 文件类型（filetype）
set statusline+=%#StatusCharIcon#%{(g:statuslineIcon.RightIcon)}      " 分隔图标
set statusline+=%#StatusChar#\ I\ LOVE\ DJL\  " 字符


"标签页
set showtabline=2 " 2 总是显示标签页，0 不显示，1 出现多个标签页才显示
set tabpagemax=15 " 最多可以打开15个标签页，默认10

" \eol:        回车
" \tab:        Tab
" \trail       行尾空格
" \space:      单词间的空格
" \nbsp        不可断空格
" \extends     屏幕右侧隐藏文本
" \precedes    屏幕左侧隐藏文本
set list
set listchars=
	\eol:\↴,
	\tab:\|\ ,
	\trail:.,
	\space:\ ,
	\nbsp:+,
	\extends:»,
	\precedes:«

" 控制窗口字符
set fillchars=
	\vert:\|,
	\eob:\

" 设置补全菜单行为
set wildmenu " 在命令模式下, 按 Tab 键显示命令菜单 (默认)
" 鼠标/键盘弹出补全菜单
set completeopt=
	\menu,
	\menuone,
	\noselect

set shortmess+=c                          " a
set pumheight=10                          " 补全菜单最大显示行数

set wildmode=longest:
	\full,
	\full  " 选择最长匹配项并展开所有匹配项

" 窗口
set splitright " 新建窗口时, 窗口会往右边放
set splitbelow " 新建窗口时, 窗口会往下边放

set conceallevel=2
set concealcursor=v

set hidden  " 允许在不保存的情况下切换缓冲区

" 禁止声音警告
set noerrorbells  " 禁止错误提示音
" set visualbell  " 代替声音警告为全屏高亮

" ========== 编辑体验 ==========

" 拼写检查设置（已经设置了autocmd）
set nospell                    " 开启拼写检查
set spelllang=en_us          " 设置拼写检查语言为美式英语
set complete+=kspell " 设置补全来源为拼写检查

set eof  " 确保文件以换行符结尾

" 缩进
set autoindent " 自动继承上一行缩进
set smartindent     " 根据代码结构智能缩进 (如 C 语言风格）
" set nocindent " C 语言风格缩进
set noexpandtab " 关闭 expandtab 的功能（即用 Tab 字符，而不是空格）
set tabstop=4 " 设置tab缩进为4个空格宽度
set shiftwidth=4 " 自动缩进时使用的空格数
set softtabstop=4 " 连续4个空格视为一个Tab (退格键一次删除 4 个空格)

" 搜索
set hlsearch " 搜索结果高亮
set incsearch " 搜索输入时逐字高亮
set ignorecase      " 搜索忽略大小写
set smartcase       " 如果搜索包含大写则区分大小写
set whichwrap+=<,>,[,],h,l " 允许光标在行首或行尾继续移动到上一行或下一行

" set gcr=a:underline-blinkwait1

" 剪贴板集成（需要 Vim 编译时支持 +clipboard）
if has('mac')
  set clipboard=unnamed  " macOS
elseif has('unix')
  set clipboard=unnamedplus " 与系统剪贴板共享（Linux/WSL）
endif

set formatoptions+=mM   "  允许多段落换行处理

set title " 在终端标题显示文件名


set mouse=a  " 所有模式启用鼠标（调整窗口大小、点击跳转等）
" set selection=exclusive   " 在可是模式下是否选中光标下的字符,要和selectmode配合使用
set selectmode=mouse,key  " 设置触发“选择模式”的方式：使用鼠标或键盘进入可视模式时进入选择模式（类似 GUI 编辑器行为）
set matchtime=5
set scrolloff=5 " 光标离窗口上下边界 5 行时窗口自动滚动
set autoread " 在 vim 以外编辑文件时,vim 里的文件会自动刷新
" 文件类型
filetype on " 检测文件类型
filetype plugin on  " 启用文件类型插件
filetype indent on  " 启用文件类型相关的缩进
set showmatch "显示匹配的括号

" ========== 性能优化 ==========
set lazyredraw          " 减少重绘（在宏执行时提升性能）
set ttyfast             " 优化终端渲染
set timeoutlen=500      " 快捷键超时时间（毫秒）
set updatetime=300  " 设置更短的更新时间（默认 4000 毫秒），提高响应速度和体验
