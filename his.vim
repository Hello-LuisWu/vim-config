" Author: Luis Wu
" Editor: VIM
" Datesss: 2025-06-07 10:01




" more color: https://www.ditig.com/publications/256-colors-cheat-sheet

autocmd BufWinEnter * :highlight PopupNotification cterm=bold ctermbg=9 ctermfg=blue guibg=red guifg=blue
highlight PopupNotification cterm=bold ctermbg=9 ctermfg=blue guibg=red guifg=blue

" hi: highlight 的简写{{{
" cterm: 字体样式
"   none:字体无样式
"   bold: 字体加粗
"   underline: 字体加下划线. 多参数逗号 , 分割
"   可写多个用逗号隔开：bold,underline
" ctermbg:命令行中的背景颜色
" ctermfg: 命令行中的前景颜色(字体颜色)
" guibg：在gui界面下的背景颜色
" guifg：在gui界面下的字体颜色
"    使用guibg,guifg, 必须打开 termguicolors}}}
"
" 屏幕对齐线样式
highlight ColorColumn cterm=bold ctermbg=9 ctermfg=blue guibg=green guifg=blue
" 目录名称以及清单中的其他特殊名称样式。 NERDTree 和startofy展示的目录名称样式
highlight Directory cterm=bold ctermfg=blue guifg=#005fd7
" 成对括号的选中样式
highlight MatchParen cterm=bold ctermbg=9 ctermfg=blue guibg=#444454
" 多窗口之间分割线的样式
highlight VertSplit cterm=bold ctermbg=9 ctermfg=blue guibg=#555544
" 光标所在行样式
highlight CursorLine cterm=none ctermbg=238 ctermfg=none guibg=#323232
" 光标所在列样式
highlight CursorColumn cterm=none ctermbg=238 ctermfg=none
" 光标所在行行号样式
highlight CursorLineNr cterm=none ctermbg=236 ctermfg=243 guibg=#323232 guifg=#999999
" 行号样式
highlight LineNr cterm=bold ctermbg=236 ctermfg=none guibg=#202020 guifg=#444445
" 搜索匹配字符样式
highlight Search cterm=bold ctermbg=245 ctermfg=254 guibg=#666666
" 逐字搜索替换时，文本选中样式
highlight IncSearch cterm=bold ctermbg=69 ctermfg=254
" 注释样式
autocmd BufWinEnter * :highlight Comment cterm=bold ctermfg=242 guifg=#666666 ctermbg=red
" 缓冲区中最后一行之后的填充行(~)
highlight EndOfBuffer cterm=bold ctermfg=236 guifg=#262626
" 未聚焦tab样式
highlight TabLine cterm=none ctermbg=239 ctermfg=248 guibg=#4e4e4e guifg=#a8a8a8
" 聚焦tab样式
highlight TabLineSel cterm=bold ctermbg=236 ctermfg=168 guibg=#202020 guifg=blue
" tab以外的样式
highlight TabLineFill cterm=bold ctermbg=236 guibg=#303030
" 命令模式下  tab建选中样式
highlight WildMenu cterm=bold ctermbg=black ctermfg=255 guibg=#5f87ff guifg=#eeeeee
" 命令行中的错误消息样式
highlight ErrorMsg cterm=bold ctermbg=202 ctermfg=235 guibg=#ff5f00 guifg=#eeeeee
":set all"， ":autocmd"等的输出标题, startify 插件小牛和文字样式
highlight Title cterm=bold ctermfg=167 guifg=#d75f5f
" Editoy background color
highlight Normal ctermbg=235 guibg=#202020 guifg=yellow
" 选择模式样式
highlight  Visual ctermbg=243 ctermfg=233
" 空白字符样式, :map 列出的元键和特殊键，
highlight SpecialKey ctermfg=237 guifg=#4e4e4e
" 回车和内容超出屏幕提示字符样式
highlight NonText ctermfg=239 guifg=#4e4e4e
" 设置 relativenumber 时，光标上面和下面行号的样式
"highlight LineNrAbove ctermbg=33
"highlight LineNrBelow ctermbg=9
" 设置状态行字体和背景颜色
" 状态栏样式
highlight StatusLine cterm=bold ctermbg=239 ctermfg=168 guibg=#4e4e4e guifg=#d75f87
" 未聚焦窗口状态栏样式
highlight StatusLineNC cterm=bold ctermfg=80 ctermbg=233 guibg=#222222 guifg=#555544
" :term 打开终端窗口状态栏样式
highlight StatusLineTerm cterm=bold ctermfg=187 ctermbg=240
" 未聚焦终端窗口状态栏样式
highlight StatusLineTermNC cterm=bold ctermfg=80 ctermbg=233

" 闭合折叠的线样式
highlight Folded cterm=bold ctermbg=234 guifg=#00ffff guibg=#4c4c4c ctermfg=239 guifg=#888888
" 左边折叠边栏样式，需要设置打开折叠边栏 set foldcolumn=2
highlight FoldColumn cterm=bold ctermbg=125 ctermfg=68 guibg=#323232 guifg=#5f87d7
" 光标所在行折叠边栏样式
highlight CursorLineFold cterm=bold ctermbg=9 ctermfg=blue guibg=#444445 guifg=blue
" :showmode 时模式字符的样式.如：-- INSERT --
highlight ModeMsg  cterm=none ctermbg=blue

" 状态行样式
hi User1 cterm=bold ctermbg=68 ctermfg=255 guibg=#5f87ff guifg=#eeeeee
hi User2 ctermbg=240 ctermfg=250 cterm=bold
hi User3 ctermbg=235 ctermfg=243 cterm=none
