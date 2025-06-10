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
