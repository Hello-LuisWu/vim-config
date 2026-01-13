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
	\
	\ 'RightIcon':   '',
\}

set statusline+=%#StatusLmode#\ \ %{(g:currentmode[mode()])}\            " 模式
set statusline+=%#StatusLmodeIcon#%{(g:statuslineIcon.LeftIcon)}  " 分隔图标
" set statusline+=%#StatusBoth2#\ \ %{gitbranch#name()}\                " Git 分支名称
set statusline+=%#StatusBoth2#\ %{GitBranchStatus()}                " Git 分支名称
set statusline+=\ %{&readonly?'[x]':'[v]'}\    " 显示只读字符为 No-edit
set statusline+=%#StatusBoth2Icon#%{(g:statuslineIcon.LeftIcon)}  " 分隔图标
set statusline+=%#StatusCenter#\ %t\                " 当前文件名

set statusline+=%{coc#status()}%{get(b:,'coc_current_function','')}                 " 修改标志 [+] 表示修改未保存
set statusline+=%m                 " 修改标志 [+] 表示修改未保存
set statusline+=%=                        " 左右分界线
set statusline+=\ %l/%L\ %p%%\       " 当前行号:列号
set statusline+=%#StatusBoth2Icon#%{(g:statuslineIcon.RightIcon)}   " 分隔图标
set statusline+=%#StatusBoth2#\ %{&fileencoding}\    " 文件编码
set statusline+=%{&fileformat}\       " 换行符格式（unix/dos）
set statusline+=%{&filetype}\             " 文件类型（filetype）
set statusline+=%#StatusCharIcon#%{(g:statuslineIcon.RightIcon)}      " 分隔图标
set statusline+=%#StatusChar#\ I\ LOVE\ DJL\  " 字符
