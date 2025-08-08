call plug#begin('~/.vim/plugged')
Plug 'https://gitee.com/hello-luiswu/nerdcommenter.git'
" Plug 'https://gitee.com/hello-luiswu/vim-fugitive.git'
Plug 'https://gitee.com/hello-luiswu/vim-startify.git'
Plug 'https://gitee.com/hello-luiswu/nerdtree.git', { 'on': 'NERDTreeToggle' }
Plug 'https://gitee.com/hello-luiswu/nerdtree-git-plugin.git'
Plug 'https://gitee.com/hello-luiswu/vim-devicons.git'
Plug 'https://gitee.com/hello-luiswu/auto-pairs.git'
Plug 'https://gitee.com/hello-luiswu/tagbar.git'
Plug 'https://gitee.com/hello-luiswu/vim-markdown.git'
Plug 'https://gitee.com/hello-luiswu/vim-markdown-toc.git'
Plug 'https://gitee.com/hello-luiswu/tabular.git'
Plug 'https://gitee.com/hello-luiswu/fzf.vim.git'
Plug 'https://gitee.com/hello-luiswu/fzf.git', { 'do': { -> fzf#install() } }
Plug 'https://gitee.com/hello-luiswu/vim-gitbranch.git'
" Plug 'https://gitee.com/hello-luiswu/gruvbox.git'
Plug 'morhetz/gruvbox'
" Plug 'https://gitee.com/hello-luiswu/lightline.vim.git'
Plug 'https://gitee.com/hello-luiswu/vim-commentary.git'
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
Plug 'https://gitee.com/hello-luiswu/coc.nvim.git', {'branch': 'release'}
" Plug 'https://gitee.com/hello-luiswu/vim-airline.git'
" Plug 'https://gitee.com/hello-luiswu/vim-airline-themes.git'
" Plug 'sheerun/vim-polyglot'
" Plug 'ellisonleao/glow.nvim'

call plug#end()
