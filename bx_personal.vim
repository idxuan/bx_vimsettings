"-------------------------------------------------------------------------
" @Author  : Xuan Jun (idxuanjun@qq.com)
" @Link    : http://blog.csdn.net/idxuanjun
" @Date    : 2013-04-21
" @Version : 0.2.0
" @Desc    : VIM 个人设置
"-------------------------------------------------------------------------

"-------------------------------------------------------------------------
" 键盘映射定义
"-------------------------------------------------------------------------
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
" 常用操作 x w q j a o h ,o ,O
"-------------------------------------------------------------------------
" 保存退出
nnoremap <Leader>x :xa!<CR>
" 保存
nnoremap <Leader>w :w<CR>
" 退出
nnoremap <Leader>q :q<CR>

" 上下左右移动（编辑模式）
inoremap <silent><C-H> <left>
inoremap <silent><C-L> <right>
inoremap <silent><C-J> <C-O>gj
inoremap <silent><C-K> <C-O>gk

" 将光标以后文本分割到下一行
nnoremap <silent><Leader>j :set paste<CR>i<CR><Esc>:set nopaste<CR>h
" 全选
nnoremap <silent><Leader>a ggVG

" 插入上下空行而不进入编辑模式，光标移动到上下行
nnoremap <silent><Leader>o o<Esc>
nnoremap <silent><Leader>O O<Esc>
" 插入上下空行而不进入编辑模式，光标留在原位
"nnoremap <silent><Leader>,o :set paste<CR>m`o<Esc>``h:set nopaste<CR>
"nnoremap <silent><Leader>,O :set paste<CR>m`O<Esc>``h:set nopaste<CR>
nnoremap <silent><Leader>,o m`o<Esc>``h
nnoremap <silent><Leader>,O m`O<Esc>``h

" 停止查找命令的高亮显示
nnoremap <silent><Leader>,h :nohlsearch<CR>

"-------------------------------------------------------------------------
" VIM v
"-------------------------------------------------------------------------
" 快速重载配置文件
nnoremap <silent><Leader>vs :call ExecuteGlobalSetting()<CR>
" 切换到配置文件目录
nnoremap <silent><Leader>vc :execute 'lcd ' . g:bx_vimsettings_path<CR>
" 切换到当前目录
nnoremap <silent><Leader>vd :cd %:p:h<CR>
" 新建或打开临时文件
nnoremap <silent><Leader>ve :edit $TEMP/vim_temp.txt<CR>

"-------------------------------------------------------------------------
" 窗口 w
"-------------------------------------------------------------------------
" 设置当前窗口为唯一窗口
nnoremap <silent><Leader>wo :only<CR>
" 切换焦点到窗口
nnoremap <silent><Leader>wk <C-W><Up>
nnoremap <silent><Leader>wj <C-W><Down>
nnoremap <silent><Leader>wh <C-W><Left>
nnoremap <silent><Leader>wl <C-W><Right>

"-------------------------------------------------------------------------
" 缓冲区 b
"-------------------------------------------------------------------------
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
" 标签页 t
"-------------------------------------------------------------------------
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
" 编辑 删除 r
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

"-------------------------------------------------------------------------
" 杂项 ,f ,c
"-------------------------------------------------------------------------
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

" 快捷输入日期格式信息（编辑模式）
iabbrev bxdatetime <C-r>=strftime("%Y-%m-%d %H:%M:%S")<CR>
iabbrev bxdate <C-r>=strftime("%Y-%m-%d")<CR>
iabbrev bxtime <C-r>=strftime("%H:%M:%S")<CR>

" 当打开的文档中含有多种语言的时候,单一使用某一种文件类型的高亮
" 方式必然会非常难看,比如说一个介绍J2EE的文件,里面必然有Java的代
" 码,也会存在很多XML的代码,这个时候需要随时切换不同的高亮方案
"nnoremap <Leader>1 :set syntax=java<CR>
"nnoremap <Leader>2 :set syntax=c<CR>
"nnoremap <Leader>3 :set syntax=xhtml<CR>
"nnoremap <Leader>4 :set syntax=python<CR>
"nnoremap <Leader>5 :set ft=javascript<CR>
"nnoremap <Leader>0 :syntax sync fromstart<CR>


