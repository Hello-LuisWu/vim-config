




inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" 检查是否可退格（用于智能 TAB 判断）
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Ctrl+Space 触发补全（Neovim 和 Vim 区别处理）
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" ==================== 诊断导航快捷键 ====================
" 跳转到上一个/下一个诊断问题
nmap <silent><nowait> [g <Plug>(coc-diagnostic-prev)
nmap <silent><nowait> ]g <Plug>(coc-diagnostic-next)

" 跳转到定义
nmap <silent><nowait> gd <Plug>(coc-definition)
" 跳转到类型定义
nmap <silent><nowait> gy <Plug>(coc-type-definition)
" 跳转到实现
nmap <silent><nowait> gi <Plug>(coc-implementation)
" 查找引用
nmap <silent><nowait> gr <Plug>(coc-references)

" 显示光标下符号的文档
nnoremap <silent> gk :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" 光标悬停时高亮符号及其引用
autocmd CursorHold * silent call CocActionAsync('highlight')

" 重命名符号
nmap gr <Plug>(coc-rename)

" 格式化选中代码/当前行
xmap gf <Plug>(coc-format-selected)
nmap gf  <Plug>(coc-format-selected)

" 设置特定文件类型的格式化表达式
augroup mygroup
  autocmd!
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
augroup end

" 对选中代码执行快速修复
" Example: `<leader>aap` for current paragraph
xmap ga  <Plug>(coc-codeaction-selected)
nmap ga  <Plug>(coc-codeaction-selected)

" 光标位置执行代码操作
nmap <leader>ac  <Plug>(coc-codeaction-cursor)
" 整个缓冲区执行代码操作
nmap <leader>as  <Plug>(coc-codeaction-source)
" 快速修复当前行诊断
nmap <leader>qf  <Plug>(coc-fix-current)

" 重构代码操作
nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)

" 运行当前 Code Lens 操作
nmap <leader>cl  <Plug>(coc-codelens-action)

" ==================== 文本对象选择 ====================
" 函数/类内部选择 (inner function/class)
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
" 函数/类整体选择 (a function/class)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" ==================== 浮动窗口控制 ====================
" 滚动浮动窗口（兼容 Neovim/Vim 新版本）
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" ==================== 高级选择 ====================
" 基于语言服务器智能选择代码范围
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" ==================== 命令 ====================
" 格式化当前缓冲区
command! -nargs=0 Format :call CocActionAsync('format')

" 折叠代码
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" 整理导入
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" ==================== 状态栏集成 ====================
" 在状态栏显示 COC 状态和当前函数
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" ==================== CocList 命令 ====================
" 显示所有诊断问题
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" 管理扩展
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" 显示可用命令
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" 显示当前文件符号大纲
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" 搜索工作区符号
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" 导航下一个列表项
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" 导航上一个列表项
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" 恢复最近使用的 CocList
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
