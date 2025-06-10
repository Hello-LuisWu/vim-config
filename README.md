# Usage

<!-- vim-markdown-toc GFM -->

    * [克隆 vimrc](#克隆-vimrc)
    * [安装 vim-plug](#安装-vim-plug)
    * [添加配置内容](#添加配置内容)
* [快捷键映射](#快捷键映射)
    * [✅ 基础映射](#-基础映射)
    * [✅ 快速跳词/字符](#-快速跳词字符)
    * [✅ 插入结构](#-插入结构)
    * [✅ 方向键禁用](#-方向键禁用)
    * [✅ 签名与注释维护](#-签名与注释维护)
    * [✅ 替换相关映射](#-替换相关映射)
    * [✅ 文件路径操作](#-文件路径操作)
    * [✅ 搜索相关映射](#-搜索相关映射)
    * [✅ 配置文件快捷访问](#-配置文件快捷访问)
    * [✅ fzf / Tagbar 插件映射](#-fzf--tagbar-插件映射)
    * [✅ Tab 页操作](#-tab-页操作)

<!-- vim-markdown-toc -->
### 克隆 vimrc

```
git clone --depth 1 https://github.com/Hello-LuisWu/vim-dotfiles.git ~/.config/vimrc
```


### 安装 vim-plug

```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://gitee.com/hello-luiswu/vim-plug/raw/master/plug.vim
```


<details>
<summary>
清除多余文件 (步骤可略过)
</summary>
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

</details>

### 添加配置内容

终端执行如下代码：

```
cat << 'EOF' > ~/.vimrc
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
EOF
```

使用以下vim命令安装插件

```
:PlugInstall
```
## 快捷键映射


### ✅ 基础映射

| 映射键位  | 功能说明                             | 模式  |
| --------- | ------------------------------------ | ----- |
| `jj`      | 插入模式下退出到普通模式             | `i`   |
| `U`       | 重做（恢复上一次撤销）               | `n`   |
| `<CR>`    | 切换自动换行显示                     | `n`   |
| `j/k`     | 移动视觉上的行（换行后也能正确上下） | `n/v` |
| `<C-r>`   | 保存当前文件并重新加载配置           | `n`   |
| `\\`      | 插入 `<++>` 占位并进入编辑           | `i`   |
| `<Tab>`   | 打开命令行（`:`）                    | `n`   |
| `<S-Tab>` | 启动搜索模式（`/`）                  | `n`   |
| `<BS>`    | 清除高亮搜索                         | `n`   |
| `gF`      | 格式化全文 `gg=G`                    | `n`   |
| `HH/LL`   | 插入模式跳到行首/尾                  | `i`   |
| `<C-d>`   | 复制当前行并粘贴到下一行             | `i/n` |

### ✅ 快速跳词/字符

| 映射键位 | 功能说明            | 模式  |
| -------- | ------------------- | ----- |
| `W/B`    | 向前/向后跳 5 个词  | `n/x` |
| `H/L`    | 移动到行首/行尾     | `n/x` |
| `J/K`    | 跳转到文件末尾/开头 | `n/x` |

### ✅ 插入结构

| 映射键位        | 功能说明          | 模式 |
| --------------- | ----------------- | ---- |
| `<C-j>`         | 插入新行（下）    | `i`  |
| `<C-k>`         | 插入新行（上）    | `i`  |
| `<C-j>/<C-k>`   | 向下/上移动选中行 | `x`  |
| `< / >`         | 左右缩进保持选中  | `x`  |
| `<Tab>/<S-Tab>` | 快速缩进（右/左） | `x`  |

### ✅ 方向键禁用

| 映射键位        | 功能说明   | 模式    |
| --------------- | ---------- | ------- |
| `<Left><Right>` | 禁用方向键 | `n/x/i` |
| `<Up><Down>`    | 禁用方向键 | `n/x/i` |

### ✅ 签名与注释维护

| 映射键位     | 功能说明           | 模式 |
| ------------ | ------------------ | ---- |
| `<Leader>sg` | 插入文件头签名注释 | `n`  |
| `<Leader>su` | 更新签名时间       | `n`  |

### ✅ 替换相关映射

| 映射键位     | 功能说明                       | 模式 |
| ------------ | ------------------------------ | ---- |
| `<Leader>ss` | 当前行中替换当前单词           | `n`  |
| `<Leader>sS` | 全局替换当前单词               | `n`  |
| `<Leader>sl` | 所有行的第一个匹配进行替换     | `n`  |
| `<Leader>si` | 手动输入全局替换，带确认       | `n`  |
| `<Leader>s`  | 选中文本后替换（使用寄存器 h） | `x`  |

### ✅ 文件路径操作

| 映射键位     | 功能说明                         | 模式 |
| ------------ | -------------------------------- | ---- |
| `<Leader>cp` | 制当前文件的绝对路径到剪贴板     | `n`  |
| `<Leader>cn` | 复制当前文件名到剪贴板           | `n`  |
| `<Leader>cd` | 切换到当前文件所在目录并显示路径 | `n`  |

### ✅ 搜索相关映射

| 映射键位    | 功能说明               | 模式 |
| ----------- | ---------------------- | ---- |
| `*`         | 搜索当前词并返回当前   | `n`  |
| `<Leader>*` | 高亮当前词但不跳转     | `n`  |
| `n/N`       | 搜索结果跳转并居中显示 | `n`  |

### ✅ 配置文件快捷访问

| 映射键位     | 功能说明           | 模式 |
| ------------ | ------------------ | ---- |
| `<Leader>ev` | 打开 `$MYVIMRC`    | `n`  |
| `<Leader>eo` | 打开 `option.vim`  | `n`  |
| `<Leader>ek` | 打开 `maps.vim`    | `n`  |
| `<Leader>ea` | 打开 `autocmd.vim` | `n`  |

### ✅ fzf / Tagbar 插件映射

| 映射键位     | 功能说明                | 模式 |
| ------------ | ----------------------- | ---- |
| `<Leader>ff` | 搜索文件 (`:Files`)     | `n`  |
| `<Leader>fb` | 搜索缓冲区 (`:Buffers`) | `n`  |
| `<Leader>fg` | 全局内容搜索 (`:Rg`)    | `n`  |
| `<Leader>T`  | 切换 Tagbar 侧边栏      | `n`  |

### ✅ Tab 页操作

| 映射键位        | 功能说明   | 模式 |
| --------------- | ---------- | ---- |
| `<Leader><Tab>` | 下一标签页 | `n`  |

