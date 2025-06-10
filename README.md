# Usage

<!-- vim-markdown-toc GFM -->

* [克隆 vimrc](#克隆-vimrc)
* [安装 vim-plug](#安装-vim-plug)
* [清除多余文件 (步骤可略过)](#清除多余文件-步骤可略过)
* [添加配置内容](#添加配置内容)

<!-- vim-markdown-toc -->
### 克隆 vimrc

```
git clone --depth 1 https://gitee.com/hello-luiswu/vimrc.git ~/.config/vimrc
```


### 安装 vim-plug

```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://gitee.com/hello-luiswu/vim-plug/raw/master/plug.vim
```

### 清除多余文件 (步骤可略过)

输入命令

```
cd ~/.vim/autoload/
```

进入该目录。

用以下命令删除多余文件

```
ls -a ./ | grep -v plug.vim | xargs rm -rf

或
rm -rf `ls -a ./ | egrep -v '(plug.vim)'`

或
ls -a ./ | egrep -v '(plug.vim)' | xargs rm -rf
```


### 添加配置内容

用 vim 打开 `.vimrc` 配置文件

```
vim ~/.vimrc
```

复制以下内容并粘贴到 `.vimrc` 配置文件里

```
" plugins 文件 最好优先加载。这配置才能读取主题等插件文件
source ~/.config/vimrc/plugins.vim
source ~/.config/vimrc/option.vim
source ~/.config/vimrc/maps.vim
source ~/.config/vimrc/autocmd.vim
" 自动加载 ~/.config/vimrc/plug-conf 下的所有 .vim 文件
let s:plugin_dir = expand('~/.config/vimrc/plug-conf')
for s:file in split(glob(s:plugin_dir . '/*.vim'), '\n')
  if filereadable(s:file)
    execute 'source' fnameescape(s:file)
  endif
endfor
```

使用以下命令安装插件

```
:PlugIntakll
```
