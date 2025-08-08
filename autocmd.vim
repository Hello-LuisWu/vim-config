" ------------------------------------------------------------------------------
" Author   : Luis Wu
" Editor   : Neovim
" Date     : 2025-07-18 09:06
" Position : /Users/luis/.config/vimrc/autocmd.vim
" System   : Darwin 24.3.0
" ------------------------------------------------------------------------------
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

