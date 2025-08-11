" ------------------------------------------------------------------------------
" Author   : Luis Wu
" Editor   : VIM
" Date     : 2025-08-10 22:19
" Position : /Users/luis/.config/vimrc/plug-conf/commentstring.vim
" System   : Darwin 24.3.0
" ------------------------------------------------------------------------------

function! InsertSignatureSmart()
    let l:date = strftime('%Y-%m-%d %H:%M')
    let l:pos = expand('%:p')
    " 获取操作系统信息
    if has('unix')
        let l:sysinfo = substitute(system('uname -sr'), '\n', '', '')
    elseif has('win32') || has('win64')
        let l:sysinfo = substitute(system('ver'), '\n', '', '')
    else
        let l:sysinfo = 'Unknown OS'
    endif

    " 根据文件类型选择注释符
    if &filetype ==# 'vim'
        let l:cmt = '"'
    elseif &filetype ==# 'lua'
        let l:cmt = '--'
    elseif &filetype ==# 'python'
        let l:cmt = '#'
    elseif &filetype ==# 'toml'
        let l:cmt = '#'
    elseif &filetype ==# 'c' || &filetype ==# 'cpp' || &filetype ==# 'java'
        let l:cmt = '//'
    else
        let l:cmt = '#'
    endif
    call append(line('.') - 1, [
        \ l:cmt . ' ------------------------------------------------------------------------------',
        \ l:cmt . ' Author   : Luis Wu',
        \ l:cmt . ' Editor   : VIM',
        \ l:cmt . ' Date     : ' . l:date,
        \ l:cmt . ' Position : ' . l:pos,
        \ l:cmt . ' System   : ' . l:sysinfo,
        \ l:cmt . ' ------------------------------------------------------------------------------'
        \ ])
endfunction
" 更新签名中的日期
function! UpdateSignatureDate()
    let l:date = strftime('%Y-%m-%d %H:%M')
    let l:pattern = '^\s*["#/-]\?\s*Date\s*:\s*\zs.*'
    " 遍历前 20 行，找到包含 Date 的注释
    for lnum in range(1, 20)
        let line_content = getline(lnum)
        if line_content =~ 'Date\s*:'
            " 替换当前行的日期部分
            let newline = substitute(line_content, l:pattern, l:date, '')
            call setline(lnum, newline)
            echo "✔ 日期已更新: " . l:date
            return
        endif
    endfor
    echo "⚠ 未找到 Date 行"
endfunction
nnoremap <leader>iu :call UpdateSignatureDate()<CR>
nnoremap <leader>ii ggO<C-[>:call InsertSignatureSmart()<CR>
