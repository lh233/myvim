https://github.com/ma6174/vim

最佳配置使用说明：
https://www.cnblogs.com/write-hua/p/7697762.html





vim 插件：

-   ctags

```
ctag -R
```

使用 sudo vim /etc/vim/vimrc 编辑vim的配置文档，在其中加入如下命令：

set tags=/home/zhouyl/linux-3.4.7/tags;后面的路径是使用 ctags -R . 后生成的tags文件所在目录，如果需要配置多个 tags，只需如下再添加即可



- vim-plug

首先介绍的就是用来管理vim插件的插件。有了它，所有插件就都可以写在配置文件中，安装、更新、删除都只需要执行一行命令来操作，十分方便。类似的插件其实有挺多，比如Vundle.vim、vim-pathogen等。他们的功能都大同小异，我最终选择vim-plug是因为它支持并行下载。当插件很多的时候，我觉得它的安装速度是最快的。

https://segmentfault.com/a/1190000018089782

- vundle插件

https://segmentfault.com/a/1190000019484603

- nerdtree

这个插件是用来查看文件目录的结构，达到类似GUI编辑器中的文件浏览器的功能。我觉得一款编辑器最重要的功能之一就是如何快速定位到所需的文件。而使用文件树的形式虽然不是最快速的，但绝对是最直观的方式。这个插件主要在我们对一个项目的目录结构还不是很熟悉的时候比较有用，等熟悉了之后更多的就会用到下面的这个插件

```
map <F2> :NERDTreeToggle<CR>
 autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary") | q | endif
```

关闭vim时，如果打开的文件除了NERDTree没有其他文件时，它自动关闭，减少多次按:q!。

开启NERDTree后进入vim如何默认光标在右侧文件编辑区：

```
autocmd VimEnter * NERDTree
wincmd w
autocmd VimEnter * wincmd w
```

- ctrlp.vim 

这个插件也是比较有代表性的，叫做“Fuzzy file finder"，意思就是文件的模糊查询。当我们需要打开一个文件的时候，只需要按ctrl+p快捷键(当然可以定制)，然后输入文件路径中的任意字符，ctrlp就会列出所有模糊匹配到的文件。如果找到了所需文件，直接回车即可打开。通常如果文件路径重名的情况比较多，则需要输入比较精确的名字，如果重名的情况少，则简单输入几个字符即可找到所需文件。这个应该是打开文件的最快方式之一了。

[Vim 插件 ctrlp.vim 模糊搜索文件 | 温欣爸比的博客](https://wxnacy.com/2017/09/23/vim-plugin-ctrlp/)

- clang-format

- leaderF

LeaderF是一个用Python`写的`vim插件，可以在成千上万数十万个文件中，通过模糊查找的方式，快速找到目标文件。它还有很多衍生功能：快速打开或定位某个buffer、最近使用的文件（mru）、tags（包括函数、类、变量等）、命令历史、文件中的某一行、vim的help、marks等等。

```
let g:Lf_ShortcutF = '<c-p>'

let g:Lf_ShortcutB = '<c-l>'

noremap <leader>p :LeaderfFile<cr>

noremap <leader>f :LeaderfSelf<cr>

noremap <leader>fm :LeaderfMru<cr>

noremap <leader>ff :LeaderfFunction<cr>

noremap <leader>fb :LeaderfBufTagAll<cr>

noremap <leader>ft :LeaderfBufTag<cr>

noremap <leader>fl :LeaderfLine<cr>

noremap <leader>fw :LeaderfWindow<cr>
```

[vim plugin介绍之LeaderF | Mingjian's Blog](https://retzzz.github.io/dc9af5aa/)

\p调用文件列表

leaderf 比 ctrlp好用

可以用tab键切换到搜索框来往下跑

一旦按`tab`, 则会进入normal模式, 可以使用大部分normal模式命令, 但是还是有一些normal模式下的LeaderF命令, 你可以在normal模式下按`F1`来显示这些命令. 支持选择多个文件, 也可以分裂窗口打开文件.

cd ~/.vim/bundle
git clone https://github.com/yggdroot/leaderf

需要安装rg工具







- cscope

[爆力解决cscope找不到文件或者其它问题（用绝对路径生成cscope.out）_yellowmid2013的博客-CSDN博客](https://blog.csdn.net/yellowmid2013/article/details/106569166)

ctrl+t可以跳转回原来的位置

```
if has("cscope")
 set csprg=/usr/bin/cscope              "指定用来执行 cscope 的命令                                                                   
 set csto=1                             "先搜索tags标签文件，再搜索cscope数据库
 set cst                                "使用|:cstag|(:cs find g)，而不是缺省的:tag
 set nocsverb                           "不显示添加数据库是否成功
 " add any database in current directory
 if filereadable("cscope.out")
   cs add /home/narwal/project/dev_pita2/lichee/linux-4.9/cscope.out                   "添加cscope数据库
   cs add /home/narwal/project/IP1221_SE/lichee/linux-4.9/cscope.out
 endif
 "set cscopeverbose
 "nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
 "这几个按键要按照顺序跑，不是同时按下
 nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR> " 查找函数、宏、枚举等定义的位置，类似ctags所提供的功能
 nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR> "  查找调用本函数的函数
 nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR> " 查找指定的字符串
 nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR> " 查找egrep模式，相当于egrep功能，但查找速度快多了
 nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR> "  查找并打开文件，类似vim的find功能
 nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR> " 查找包含本文件的文件
 nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR> " 查找本函数调用的函数
 "set csverb         
 #endif
```



- bufexplorer

用来使用查看历史文件的

[vim插件之bufexplorer_qwaszx523的博客-CSDN博客_bufexplorer](https://blog.csdn.net/qwaszx523/article/details/77853441)

```
""""""""""""""""""""""""""""""

" BufExplorer

""""""""""""""""""""""""""""""

let g:bufExplorerDefaultHelp=0       " Do not show default help.

let g:bufExplorerShowRelativePath=1  " Show relative paths.

let g:bufExplorerSortBy='mru'        " Sort by most recently used.

let g:bufExplorerSplitRight=1        " Split left.

let g:bufExplorerSplitVertical=1     " Split vertically.

let g:bufExplorerSplitVertSize = 30  " Split width

let g:bufExplorerUseCurrentWindow=1  " Open in new window.

let g:bufExplorerDisableDefaultKeyMapping =0 " Do not disable default key mappings.

nnoremap <silent> <F9> :BufExplorer<CR>
```

配置方向键不使用，强制使用vim jkhl

```
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
```

-   tagbar插件

安装流程：https://codeantenna.com/a/RpuXsCNLnD

-   vim-gitgutter

