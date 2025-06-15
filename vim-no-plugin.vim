" Author: Luis Wu
" Editor: VIM
" Datesss: 2025-06-08 10:38
"position: /Users/luis/.config/vimrc/maps.vim

let mapleader = " "
inoremap jj <C-[>
nnoremap U <C-r>
nnoremap <CR> :set wrap!<CR>
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
nnoremap <C-r> :w<CR>:source %<CR>
imap \\ <C-[>/<++><CR>:nohlsearch<CR>c4l
nnoremap <tab> :
nnoremap <S-tab> /
" nnoremap \ /
nnoremap <silent> <BS> :nohls<CR>
nnoremap gF  gg=G   " 格式化

inoremap HH <C-[>I
inoremap LL <C-[>A

" 再制
inoremap <C-d> <C-[>yypA
nnoremap <C-d> <C-[>yyp

for mode in ['n', 'x']
	execute mode . 'noremap q: <Nop>'
endfor

for mode in ['n', 'x']
	execute mode . 'noremap W 5w'
	execute mode . 'noremap B 5b'
endfor


for mode in ['n', 'x']
	execute mode . 'noremap H g0'
	execute mode . 'noremap L g$'
	execute mode . 'noremap J G'
	execute mode . 'noremap K gg'
endfor

" inoremap ( ()<C-[>i
" inoremap [ []<C-[>i
" inoremap { {}<C-[>i
" inoremap ' ''<C-[>i
" inoremap " ""<C-[>i
" inoremap < <><C-[>i
xnoremap <C-j> :m '>+1<CR>gv=gv
xnoremap <C-k> :m '<-2<CR>gv=gv
inoremap <C-j> <C-[>o
inoremap <C-k> <C-[>O

for mode in ['n', 'x', 'i']
	execute mode . 'noremap <left> <Nop>'
	execute mode . 'noremap <right> <Nop>'
	execute mode . 'noremap <up> <Nop>'
	execute mode . 'noremap <down> <Nop>'
endfor

" 插入签名注释
nnoremap <Leader>sg ggO<Esc>O" Author: Luis Wu<CR>" Editor: VIM<CR>" Datesss: <C-r>=strftime("%Y-%m-%d %H:%M")<CR><Esc>
" 更新编辑时间
nnoremap <Leader>su /\"\ Datesss:\ <CR>cc" Datesss: <C-r>=strftime("%Y-%m-%d %H:%M")<CR><Esc>

" 保持缩进状态
xnoremap < <gv
xnoremap > >gv
xnoremap <S-Tab> <gv
xnoremap <Tab> >gv

nnoremap <Leader>cp :let @+=expand('%:p')<CR>     " 复制当前文件路径
nnoremap <Leader>cn :let @+=expand('%:t')<CR>     " 复制文件名
nnoremap <Leader>cd :cd %:p:h<CR>:pwd<CR>         " 切换当前文件所在目录为工作目录

" 查找高亮下一个
nnoremap * *N
" 高亮当前单词（不跳转）
nnoremap <Leader>* :let @/='\<'.expand('<cword>').'\>'<CR>:set hls<CR>

" 当前单词替换(仅所在单词)
nnoremap <Leader>ss :s/\<<C-r><C-w>\>/
" 当前单词替换(全局)
nnoremap <Leader>sS :%s/\<<C-r><C-w>\>//g<Left><Left>
" 当前单词替换(所有行的第一个匹配)
nnoremap <Leader>sl :%s/\<<C-r><C-w>\>/
" 手动输入全局替换(带确认)
nnoremap <Leader>si :%s//gc<left><left><left>
" 所选文本替换
xnoremap <Leader>s "hy:s/<C-r>h//<Left>

" sudo 保存
cnoremap w!! w !sudo tee > /dev/null %

" 打开 vim 配置文件
nnoremap <Leader>ev :e $MYVIMRC<CR>
nnoremap <Leader>eo :e ~/.config/vimrc/option.vim<CR>
nnoremap <Leader>ek :e ~/.config/vimrc/maps.vim<CR>
nnoremap <Leader>ea :e ~/.config/vimrc/autocmd.vim<CR>

" 用法：:H keyword 即可高亮某个关键字
command! -nargs=1 H let @/ = <q-args> | set hlsearch

" 搜索后保持居中
nnoremap n nzzzv
nnoremap N Nzzzv

" 补全菜单中使用 Tab/Shift-Tab 进行上下移动
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <C-f> <C-n>

nnoremap <left> :vertical resize -2<CR>
nnoremap <right> :vertical resize +2<CR>
nnoremap <down> :resize +2<CR>
nnoremap <up> :resize -2<CR>

" tab 配置
nnoremap <leader><Tab> :tabnext<CR>
nnoremap <leader><S-Tab> :tabprevious<CR>
" nnoremap <leader><Tab> gt
" nnoremap <leader><S-Tab> gT
nnoremap <leader>tc :tabclose<CR>
nnoremap <leader>to :tabonly<CR>

" buffer配置
" nnoremap <Tab> :bnext<CR>            " 下一个 buffer
" nnoremap <S-Tab> :bprevious<CR>      " 上一个 buffer
nnoremap <Leader>wd :bd<CR>          " 删除当前 buffer
nnoremap <Leader>wa :bufdo bd<CR>    " 删除所有 buffer

" 窗口配置
nnoremap <leader>wc :close<CR>    " 关闭窗口
nnoremap <leader>wo :only<CR>     " 关闭其他窗口
nnoremap <leader>ws :vsplit<CR>   " 垂直分屏
nnoremap <leader>wS :split<CR>    " 水平分屏
nnoremap <leader>wn <C-w>n        " 新建空白窗口
nnoremap <leader>wd <C-w>=        " 窗口等宽
nnoremap <leader>wh <C-w>H        " 窗口移动到最左边
nnoremap <leader>wj <C-w>J        " 窗口移动到最下边
nnoremap <leader>wk <C-w>K        " 窗口移动到最上边
nnoremap <leader>wl <C-w>L        " 窗口移动到最右边
nnoremap <C-h> <C-w>h             " 光标焦点左移
nnoremap <C-j> <C-w>j             " 光标焦点下移
nnoremap <C-k> <C-w>k             " 光标焦点上移
nnoremap <C-l> <C-w>l             " 光标焦点右移

command! -nargs=1 Rename call s:RenameFile(<f-args>)
function! s:RenameFile(newname)
  let old = expand('%')
  if filereadable(old)
    call rename(old, a:newname)
    exec 'edit ' . a:newname
    call delete(old)
  else
    echoerr "当前缓冲区文件不存在或不可重命名"
  endif
endfunction
nnoremap <leader>wr :Rename<space>  " 重命名文件

nnoremap <C-f> <C-f>zz
nnoremap <C-b> <C-b>zz

" nnoremap ,a mpgUiW"pciW<C-R>=substitute(@p,'-','_','ge')<CR><ESC>`p:delm p<cr>
" inoremap ,a <ESC>mpgUiW"pciW<C-R>=substitute(@p,'-','_','ge')<CR><ESC>`p:delm p<CR>a

" 将选中内容转为小写
vnoremap <leader>u gu

" 将选中内容转为大写
vnoremap <leader>U gU

" 当前单词一键大写（normal模式）
nnoremap <leader>U gUiw

" 当前单词一键小写
nnoremap <leader>u guiw

" This is maps setup of the Markdown ===
autocmd Filetype markdown inoremap --- <Enter>---<Enter><br/><Enter>
autocmd Filetype markdown inoremap BB **** <++><Esc>F*hi
autocmd Filetype markdown inoremap DD ****** <++><Esc>F*hhi
autocmd Filetype markdown inoremap II ** <++><Esc>F*i
autocmd Filetype markdown inoremap SS ~~~~ <++><Esc>F~hi
autocmd Filetype markdown inoremap UU <u></u> <++><Esc>2F<i
autocmd Filetype markdown inoremap LS <details><Enter><summary></summary><Enter><++><Enter></details><Esc>2k0f>a
autocmd Filetype markdown inoremap ` `` <++><Esc>F`i
autocmd Filetype markdown inoremap ``` `````` <++><Esc>3F`i
autocmd Filetype markdown inoremap <leader>` ```<Enter>```<Enter><++><Esc>2kA
autocmd Filetype markdown inoremap ~~ ~~~<Enter><Enter>~~~<Enter><++><Esc>2kA
autocmd Filetype markdown inoremap <leader>pp ![](<++>) <++><Esc>F[a
autocmd Filetype markdown inoremap <leader>aa [](<++>) <++><Esc>F[a
autocmd Filetype markdown inoremap !! #<Space>
autocmd Filetype markdown inoremap @@ ##<Space>
autocmd Filetype markdown inoremap ## ###<Space>
autocmd Filetype markdown inoremap $$ ####<Space>

nnoremap <Leader>ga :!git add .<CR>
nnoremap <Leader>gs :!git status<CR>
nnoremap <Leader>gc :!git commit -m ""<Left>
nnoremap <Leader>gp :!git push<CR>
" Vim 里用这个（打开新窗口运行 shell）
nnoremap <C-t> :terminal<CR>


" vim 默认配置文件路径：/etc/vim/vimrc; /usr/share/vim/vimrc
" more color: https://www.ditig.com/publications/256-colors-cheat-sheet

" ========== 基础设置 ==========
set nocompatible " 禁用 Vi 兼容模式（确保使用 Vim 的全部功能）
" 字符编码
set encoding=utf-8 " Vim 内部编码,  如字符编码格式,如buffer、寄存器、Vim 脚本文件等
set fileencoding=utf-8 " 写入文件使用的编码
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936 " 尝试读取文件时的编码顺序
set termencoding=utf-8
" 非所有 Vim 都编译支持中文菜单，加上判断防止报错
if exists('+langmenu')
  set langmenu=zh_CN.UTF-8
endif
set helplang=cn " 查询帮助显示的语言
" set backspace=2 " 让 backspace 生效.不加参数则只能删除新添加的内容
set backspace=indent,eol,start

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
set fileformats=unix,dos,mac

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
" colorscheme gruvbox
set background=dark " 背景颜色为黑色

" 行设置
set numberwidth=4 " 行号列宽度
set number " 开启行号
set relativenumber " 开启相对行号
" set ruler           " 显示光标位置（行列百分比）
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
set laststatus=2 " 显示状态行，值为 0 不显示，值为 1 当有多个窗口才显示，值为2 永久显示
" 获取当前路径，将$HOME转化为~
function! CurDir()
	let curdir = substitute(getcwd(), $HOME, "~", "g")
	return curdir
endfunction
set virtualedit=block,onemore " 光标在 normol 模式下,可以定位到最后一个字的后面

" let g:currentmode={
"        \ 'n'  : 'N',
"        \ 'v'  : 'V',
"        \ 'V'  : 'V·L',
"        \ "\<C-V>" : 'V·B',
"        \ 'i'  : 'I',
"        \ 'R'  : 'R',
"        \ 'Rv' : 'V·Replace',
"        \ 'c'  : 'C',
"    \}
" set statusline=%1*\ %{(g:currentmode[mode()])}\ %2*\ %t\ %3*\ %m%r%h\ %=\ %l:%p%%\ %2*%{((&fenc==\"\")?\"\":\"\ \".&fenc)}\ %1*\ %Y\
" 显示状态栏（确保一直可见）
" 自定义状态栏高亮组
" 使用 ctermfg / ctermbg 设置 256 色状态栏配色
" highlight StatusMode ctermfg=15 ctermbg=24 cterm=bold
" highlight StatusFile ctermfg=15 ctermbg=237
" highlight StatusFlag ctermfg=15 ctermbg=53
" highlight StatusInfo ctermfg=15 ctermbg=29" 定义状态栏格式
" 状态栏模式：Gruvbox 黄色（#fabd2f） + 背景色（#3c3836）
highlight StatusMode ctermfg=214 ctermbg=6 cterm=bold guifg=#fabd2f guibg=#008080

" 文件名区域：Gruvbox 淡灰（#ebdbb2） + 暗背景（#282828）
highlight StatusFile ctermfg=223 ctermbg=23 guifg=#ebdbb2 guibg=#005f5f

" 状态标志（只读、修改）：Gruvbox 红（#fb4934） + 暗背景
highlight StatusFlag ctermfg=167 ctermbg=238 guifg=#fb4934 guibg=#303030

" 信息区域（行列、编码等）：Gruvbox 绿（#b8bb26） + 暗背景
highlight StatusInfo ctermfg=142 ctermbg=237 guifg=#b8bb26 guibg=#3c3836
set statusline=

" 左侧：模式、文件名、只读、是否修改
set statusline+=%#StatusMode#\ %{mode()}\         " 当前模式
set statusline+=%#StatusFile#\ %f\                " 当前文件名（带路径）
set statusline+=%#StatusFlag#%r                 " 只读标志 [RO]
set statusline+=%#StatusFlag#\ %m                 " 修改标志 [+] 表示修改未保存

" 分隔符（左对齐与右对齐之间）
set statusline+=%=

" 右侧：行号:列号、百分比、编码、换行符类型、文件类型
set statusline+=%#StatusInfo#\ %lL " 当前行号:列号
" set statusline+=\ %p%%             " 文件光标百分比位置
set statusline+=\ %{&fileencoding} " 文件编码
set statusline+=\ %{&fileformat} " 换行符格式（unix/dos）
set statusline+=\ %Y\             " 文件类型（filetype）
set statusline+=%#StatusMode#\ LOVE\ DJL\  " 字符

"标签页
set showtabline=2 " 2 总是显示标签页，0 不显示，1 出现多个标签页才显示
set tabpagemax=15 " 最多可以打开15个标签页，默认10

" 缩进参考线（需要插件如 indentLine）
" Plug 'Yggdroot/indentLine'  " 安装后启用
" let g:indentLine_char = '│'  " 缩进线字符

set list                   " 显示 <Tab> 和 <EOL>
" 控制列表符号
set listchars=eol:\ ,tab:\|\ ,trail:.,extends:>,precedes:<
" 控制窗口字符
set fillchars=vert:\|,eob:\ " 窗口间的分隔符

" 设置补全菜单行为
set wildmenu " 在命令模式下, 按 Tab 键显示命令菜单 (默认)
set completeopt=menu,menuone,noselect     " 鼠标/键盘弹出补全菜单
set shortmess+=c                          " 补全时不显示过多信息
set pumheight=10                          " 补全菜单最大显示行数


set wildmode=longest:full,full  " 选择最长匹配项并展开所有匹配项

" 窗口
set splitright " 新建窗口时, 窗口会往右边放
set splitbelow " 新建窗口时, 窗口会往下边放

set conceallevel=2
set concealcursor=v

set hidden  " 允许在不保存的情况下切换缓冲区

" 禁止声音警告
set noerrorbells  " 禁止错误提示音
" set visualbell  " 代替声音警告为可视警告

" ========== 编辑体验 ==========

" 拼写检查设置（已经设置了autocmd）
" set spell                    " 开启拼写检查
" set spelllang=en_us          " 设置拼写检查语言为美式英语
" set complete+=kspell " 设置补全来源为拼写检查

set eof  " 确保文件以换行符结尾

" 缩进
set autoindent " 自动继承上一行缩进
set smartindent     " 根据代码结构智能缩进 (如 C 语言风格）
" set cindent " C 语言风格缩进
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


set mouse=a  " 所有模式启用鼠标（调整窗口大小、点击跳转等）
set selection=exclusive   " 在可是模式下是否选中光标下的字符,要和selectmode配合使用
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



" 大文件处理（禁用插件和高耗能功能）
augroup LargeFile
  autocmd!
  autocmd BufReadPre * if getfsize(expand("%")) > 10 * 1024 * 1024 |
    \ set eventignore+=FileType |
    \ set nocursorline nocursorcolumn norelativenumber |
    \ syntax off |
    \ endif
augroup END

" ========== 按文件类型设置 ==========
" Python 专用配置
augroup PythonSettings
  autocmd!
  autocmd FileType python setlocal shiftwidth=4 tabstop=4
  autocmd FileType python nnoremap <buffer> <Leader>r :!python %<CR>
augroup END

" Markdown 配置（如实时预览）
augroup MarkdownSettings
  autocmd FileType markdown setlocal wrap linebreak
  autocmd FileType markdown nnoremap <buffer> <Leader>p :!glow %<CR>  " 需要安装 Glow
augroup END

" 自动恢复上次光标位置
autocmd BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\   exe "normal! g`\"" |
\ endif

autocmd InsertEnter,InsertLeave * setlocal number relativenumber!
" autocmd InsertEnter * setlocal norelativenumber number
" autocmd InsertLeave * setlocal relativenumber number

" . 保存时自动删除行尾空格
autocmd BufWritePre * %s/\s\+$//e

" . 禁止自动注释新行
autocmd FileType * setlocal formatoptions-=cro

" 类似 mkdir -p，自动创建保存路径中缺失的目录
autocmd BufWritePre * call mkdir(expand("<afile>:p:h"), "p")

" . 自动读取外部更改的文件
autocmd FocusGained,BufEnter * checktime


" 保存 .vimrc 后立即应用更改。
autocmd BufWritePost ~/.vimrc source %

" 在写入 C 文件时自动运行 clang-format
" autocmd BufWritePre *.c,*.h :silent! %!clang-format

" 写入 git commit message 文件时设置 72 字符列宽指示线
autocmd FileType gitcommit setlocal colorcolumn=72

" autocmd FileType python setlocal tabstop=4 shiftwidth=4 expandtab
autocmd FileType js,javascript,yaml setlocal tabstop=2 shiftwidth=2 expandtab
" 检测并启用拼写检查（仅在 markdown / gitcommit 中）
autocmd FileType markdown,gitcommit setlocal spell spelllang=en_us complete+=kspell

" setlocal：只对当前 buffer 生效，不影响其他窗口。

augroup IndentByFileType
	autocmd!
	" C/C++ 等使用 cindent
	autocmd FileType c,cpp,java setlocal cindent nosmartindent

	" Python、JavaScript、Lua 等使用 smartindent
	autocmd FileType python,javascript,lua setlocal smartindent nocindent

	" 默认关闭两者，避免冲突（可选）
	" autocmd FileType * setlocal nosmartindent nocindent
augroup END

" 设置JSON 文件高亮
autocmd BufRead,BufNewFile *.json set filetype=json

