" ======== nerdtree-git-plugin config
" 禁用 NERDTree 的 Git 状态标志
let g:NERDTreeGitStatusEnable = 1
" 是否只显示已变更文件的Git图标
let g:NERDTreeGitStatusShowClean = 1
" 自定义 Git 图标
let g:NERDTreeGitStatusIndicatorMapCustom = {
	\ 'Modified'  :'✹',
	\ 'Staged'    :'✚',
	\ 'Untracked' :'✭',
	\ 'Renamed'   :'➜',
	\ 'Unmerged'  :'═',
	\ 'Deleted'   :'✖',
	\ 'Dirty'     :'✗',
	\ 'Ignored'   :'☒',
	\ 'Clean'     :'✔︎',
	\ 'Unknown'   :'?',
\ }

" 显示行号
let NERDTreeShowLineNumbers                 = 1
let NERDTreeAutoCenter                      = 1
" 是否显示隐藏文件
let NERDTreeShowHidden                      = 1
" 设置宽度
let NERDTreeWinSize                         = 30
" 在终端启 vim时，共享NERDTree
let g:nerdtree_tabs_open_on_console_startup = 1
" 忽略一下文件的显示
let NERDTreeIgnore                          = ['\.pyc','\~$','\.swp']
" 显示书签列表
let NERDTreeShowBookmarks                   = 1
"当NERDTree为剩下的唯一窗口时自动关闭
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"jset guifont=SauceCodePro_Nerd_Font:h11
let g:NERDTreeDirArrowExpandable  = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'




" Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif
