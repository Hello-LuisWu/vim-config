" ------------------------------------------------------------------------------
" Author   : Luis Wu
" Editor   : VIM
" Date     : 2025-08-30 21:30
" Position : /Users/luis/.config/vimrc/maps.vim
" System   : Darwin 24.3.0
" ------------------------------------------------------------------------------
" 基础 以空格键为先导键
let mapleader = " "

" fzf 模糊搜索
" 搜索文件
nnoremap <Leader>ff :Files<CR>
" 搜索缓冲区
nnoremap <Leader>fb :Buffers<CR>
" 全局内容搜索
nnoremap <Leader>fg :Rg<CR>

" Tagbar 代码结构
nnoremap <Leader>T :TagbarToggle<CR>
let g:tagbar_width = 30               " 侧边栏宽度

nnoremap <c-e> :NERDTreeToggle<CR>

nmap j <Plug>(accelerated_jk_gj)
nmap k <Plug>(accelerated_jk_gk)

nnoremap s <Plug>(easymotion-prefix)

imap jj <C-[>
nnoremap U <C-r>
nnoremap <CR> :set wrap!<CR>
nnoremap <C-r> :w<CR>:source %<CR>
imap \\ <C-[>/<++><CR>:nohlsearch<CR>c4l
nnoremap <tab> :
nnoremap ; :
nnoremap <S-tab> /
" nnoremap \ /
nnoremap <silent> <BS> :set hls!<CR>
nnoremap gF  gg=G

inoremap HH <C-[>I
inoremap LL <C-[>A

" 再制
inoremap <C-d> <C-[>yypA
nnoremap <C-d> yyp

for mode in ['n', 'x']
	execute mode . 'noremap q: <Nop>'
endfor

for mode in ['n', 'x']
	execute mode . 'noremap W 5w'
	execute mode . 'noremap B 5b'
endfor


for mode in ['n', 'x']
	execute mode . 'noremap H 0'
	" execute mode . 'noremap H g0'
	execute mode . 'noremap L $'
	" execute mode . 'noremap L g$'
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

" 用法：:H keyword 即可高亮某个关键字
command! -nargs=1 H let @/ = <q-args> | set hlsearch

" 搜索后保持居中
nnoremap n nzzzv
nnoremap N Nzzzv

" 补全菜单中使用 Tab/Shift-Tab 进行上下移动
" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" inoremap <C-f> <C-n>

nnoremap <silent> <S-left> :vertical resize -2<CR>
nnoremap <silent> <S-right> :vertical resize +2<CR>
nnoremap <silent> <S-down> :resize +2<CR>
nnoremap <silent> <S-up> :resize -2<CR>

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

" 重命名文件
nnoremap <leader>wr :Rename<space>

" nnoremap ,a mpgUiW"pciW<C-R>=substitute(@p,'-','_','ge')<CR><ESC>`p:delm p<cr>
" inoremap ,a <ESC>mpgUiW"pciW<C-R>=substitute(@p,'-','_','ge')<CR><ESC>`p:delm p<CR>a

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

" Vim 里用这个（打开新窗口运行 shell）
nnoremap <silent> <C-t> :terminal<CR>
