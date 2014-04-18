"-------------------------------------------------------------------------
" @Author  : Xuan Jun (idxuanjun@qq.com)
" @Link    : http://blog.csdn.net/idxuanjun
" @Date    : 2013-04-21
" @Version : 0.1.0
" @Desc    : VIM 个人设置
"-------------------------------------------------------------------------

"-------------------------------------------------------------------------
" 个人信息定义，需要安装插件NERD_commenter，LoadTemplate，AuthorInfoDetect
"-------------------------------------------------------------------------
" :LoadTemplate       根据文件后缀自动加载模板

let g:template_path = g:vimfiles_path . 'bundle/load_template/template/'

" :AuthorInfoDetect   自动添加作者、时间等信息，本质是
" NERD_commenter && authorinfo的结合
let g:vimrc_author='Xuan Jun'
let g:vimrc_email='idxuanjun@qq.com'
let g:vimrc_homepage='http://blog.csdn.net/idxuanjun'
" snipMate            Tab智能补全
let g:snips_author='XuanJun'

"-------------------------------------------------------------------------
" 键盘映射定义
"-------------------------------------------------------------------------
" "nnoremap"表示普通模式下的映射定义,
" ":map" 和 ":map!" 命令为多个模式定义和回显映射.在 Vim 中你可
" 以使用 ":nnoremap", ":vmap", ":omap", ":cmap" 和 ":innoremap" 命令来对每
" 个不同的模式分别定义映射.
" 当列出映射时,前面两栏的字符表示 (可有多个):
"   字 符       模 式
"   "<Space>"   普通、可视、选择和操作符等待
"   "n"         普通
"   "v"         可视和选择
"   "s"         选择
"   "x"         可视
"   "o"         操作符等待
"   "!"         插入和命令行
"   "i"         插入
"   "l"         插入、命令行和 Lang-Arg 模式的 ":lmap" 映射
"   "c"         命令行

"-------------------------------------------------------------------------
" VIM 缓冲区设置
"-------------------------------------------------------------------------
" 本选项控制缓冲区切换的行为。可能的值是 (逗号分隔的列表):
" 'switchbuf' 'swb' 字符串  (缺省为 "")
"   useopen 如果包含，跳到第一个打开的包含指定缓冲区的窗口 (如果有
"        的话)。
"        否则: 不检查其它窗口。
"        |quickfix| 命令在跳转到错误时 (":cc"、":cn"、"cp"，等
"        等) 检查此设置。所有缓冲区相关的分割命令也会，比如
"        ":sbuffer"、":sbnext" 或 ":sbrewind"。
"   usetab  类似于 "useopen"，但也考虑其它标签页里的窗口。
"   split   如果包含，在载入用于在 |quickfix| 命令里显示错误的缓冲
"        区之前分割当前窗口。不然: 不分割，使用当前窗口。
"   newtab  类似于 "split"，但打开新标签页。如果和 "split" 同时存
"        在，本值优先。
if v:version>=700
    set switchbuf=usetab
endif

" 删除缓冲区
nnoremap <Leader>bd :bdelete<CR>
" 强制删除缓冲区
nnoremap <Leader>bd! :bdelete!<CR>
" 卸载缓冲区
nnoremap <Leader>bu :bunload<CR>
" 强制卸载缓冲区
nnoremap <Leader>bu! :bunload!<CR>
" 上一个缓冲区
nnoremap <Leader>bp :bprevious<CR>
" 下一个载缓冲区
nnoremap <Leader>bn :bnext<CR>
"-------------------------------------------------------------------------
" VIM 标签页设置
"-------------------------------------------------------------------------
" 本选项的值指定何时显示带有标签页标签的行:
" 'showtabline' 'stal'  数值型  (缺省为 1)
"    0: 永远不会
"    1: 至少有两个标签页时才会
"    2: 永远会
if exists("&showtabline")
    set showtabline=0
endif

" 上一个标签
"nnoremap <Leader>tp :tabp<CR>
" 下一个标签
"nnoremap <Leader>tn :tabn<CR>
" 新建标签
"nnoremap <Leader>tt :tabnew<CR>
" 关闭标签
"nnoremap <Leader>tq :tabclose<CR>
"
"if has("gui_running")
"    noremap <C-Tab> :tabp<CR>           " 左标签页
"    noremap <C-S-Tab> :tabn<CR>         " 右标签页
"    noremap <C-T> :tabnew<CR>           " 新建标签页
"    noremap <C-Q> :tabclose<CR>         " 关闭标签页
"endif

"-------------------------------------------------------------------------
" VIM
"-------------------------------------------------------------------------
" 快速重载配置文件
nnoremap <Leader>,sv :call ExecuteGlobalSetting()<CR>
" 切换到配置文件目录
nnoremap <silent><Leader>,cv :lcd vimsettings<CR>
" 切换到当前目录
nnoremap <silent><Leader>,cd :cd %:p:h<CR>
" 新建或打开临时文件
nnoremap <silent><Leader>,et :edit $TEMP/vim_temp.txt<CR>

" 设置当前窗口为唯一窗口
nnoremap <Leader>wo :only<CR>
" 切换窗口
nnoremap <Leader>wk <C-W><Up>
nnoremap <Leader>wj <C-W><Down>
nnoremap <Leader>wh <C-W><Left>
nnoremap <Leader>wl <C-W><Right>

nnoremap <S-Up> <C-W><Up>
nnoremap <S-Down> <C-W><Down>
nnoremap <S-Left> <C-W><Left>
nnoremap <S-Right> <C-W><Right>

"-------------------------------------------------------------------------
" 引号及括号自动匹配
"-------------------------------------------------------------------------
inoremap <silent>( ()<ESC>i
inoremap <silent>) <C-R>=ClosePair(')')<CR>
inoremap <silent>{ {}<ESC>i
inoremap <silent>} <C-R>=ClosePair('}')<CR>
inoremap <silent>[ []<ESC>i
inoremap <silent>] <C-R>=ClosePair(']')<CR>
"inoremap <silent>< <><ESC>i
"inoremap <silent>> <C-R>=ClosePair('>')<CR>
"inoremap <silent>" ""<ESC>i
"inoremap <silent>' ''<ESC>i
"inoremap <silent>` ``<ESC>

function! ClosePair(char)
  if getline('.')[col('.') - 1] == a:char
    return "\<Right>"
  else
    return a:char
  endif
endf

" 上下左右移动
inoremap <silent><C-H> <left>
inoremap <silent><C-L> <right>
inoremap <silent><C-J> <C-O>gj
inoremap <silent><C-K> <C-O>gk

" 设置快速保存
" ":xa!" 保存所有修改过的缓冲区,甚至包括只读的,但后退出Vim.不过,
" 如果有无名或者其它元婴写入失败的缓冲区,Vim仍然不会退出.
" ":w!" 和 ":w" 类似,但即使 "readonly" 已置位或者有其他原因写入被拒
" 绝,还是强制写入.
"  注意:这可能会改变文件的权限和所有者,或者破坏(符号)连接.但在
" "cpoptions" 里加上 "W" 标志位可以避免这一点.
nnoremap <Leader>x :xa!<CR>

"-------------------------------------------------------------------------
" MISC
"-------------------------------------------------------------------------
" 删除行首空格Tab
nnoremap <silent><Leader>r^ :%s/^\s*//g<CR>:nohlsearch<CR>
" 删除行尾空格Tab
nnoremap <silent><Leader>r$ :%s/\s*$//g<CR>:nohlsearch<CR>
" 删除只有空格的行
nnoremap <silent><Leader>rn :g/^\s*$/d<CR>:nohlsearch<CR>
" 删除超过两个空行，需要先删除空格
nnoremap <silent><Leader>rn2 :%s/\n\{3,\}/\r\r/g<CR>:nohlsearch<CR>
" Windows系统的换行符为\r\n,而Linux/Unix系统则为\n.因此,在Windows里编辑
" 过的文本文件到了Linux/Unix里,每一行都会多出一个^M.
" 命令中的 "^M" 是通过键入 <ctrl-v><enter> 或 <ctrl-v><ctrl-m> 生成的.
" 可以在用以下命令清除该字符:
nnoremap <silent><Leader>rm :%s/\r//g<CR>:nohlsearch<CR>

" 插入上下空行而不进入编辑模式，光标移动到上下行
nnoremap <silent><Leader>o o<Esc>
nnoremap <silent><Leader>O O<Esc>
" 插入上下空行而不进入编辑模式，光标留在原位
"nnoremap <silent><Leader>o :set paste<CR>m`o<Esc>``h:set nopaste<CR>
"nnoremap <silent><Leader>O :set paste<CR>m`O<Esc>``h:set nopaste<CR>
nnoremap <silent><Leader>,o m`o<Esc>``h
nnoremap <silent><Leader>,O m`O<Esc>``h
" 将光标以后文本分割到下一行
nnoremap <silent><Leader>j :set paste<CR>i<CR><Esc>:set nopaste<CR>h
" 全选
nnoremap <silent><Leader>a ggVG


" 这里的意思是定义快速转换文件格式的快捷键映射
nnoremap <Leader>,fd :set ff=dos<CR>
nnoremap <Leader>,fu :set ff=unix<CR>
nnoremap <Leader>,fm :set fm=mac<CR>

" 按下<Leader>ch 就可以将当前光标下的列高亮，
" 再按下一次，取消高亮；并且可以同时多列高亮
nnoremap <silent><Leader>,ch :call SetColorColumn()<CR>

function! SetColorColumn()
    let col_num = virtcol(".")
    let cc_list = split(&cc, ',')
    if count(cc_list, string(col_num)) <= 0
        execute "set cc+=".col_num
    else
        execute "set cc-=".col_num
    endif
endfunction

" 快捷输入日期格式信息
iabbrev xdate <C-r>=strftime("%Y-%m-%d %H:%M:%S")<CR>

" 当打开的文档中含有多种语言的时候,单一使用某一种文件类型的高亮
" 方式必然会非常难看,比如说一个介绍J2EE的文件,里面必然有Java的代
" 码,也会存在很多XML的代码,这个时候需要随时切换不同的高亮方案
"nnoremap <Leader>1 :set syntax=java<CR>
"nnoremap <Leader>2 :set syntax=c<CR>
"nnoremap <Leader>3 :set syntax=xhtml<CR>
"nnoremap <Leader>4 :set syntax=python<CR>
"nnoremap <Leader>5 :set ft=javascript<CR>
"nnoremap <Leader>0 :syntax sync fromstart<CR>


