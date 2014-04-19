"-------------------------------------------------------------------------
" @Author  : Xuan Jun (idxuanjun@qq.com)
" @Link    : http://blog.csdn.net/idxuanjun
" @Date    : 2013-04-21
" @Version : 0.2.0
" @Desc    : VIM 主配置文件
"-------------------------------------------------------------------------

"-------------------------------------------------------------------------
" 自定义全局设置
"-------------------------------------------------------------------------
" Vim 字符编码，1:使用UTF-8; 0:使用系统字符集
let g:vim_encoding_utf8 = 1

" 转换命令字符串从 UTF-8 到 chinese
function! EncToChs(filename)
    return iconv(a:filename, &encoding, 'chinese')
endf

"-------------------------------------------------------------------------
" Vim 全局设置
"-------------------------------------------------------------------------
" 关闭兼容模式，必须
set nocompatible

" 定义 "mapleader"变量
let mapleader = ","
let g:mapleader = ","
" 定义“;”代替“:”，方便快捷输入命令
"map ; :

" 将剪贴板"*设为未命名寄存器，方便和其它程序复制粘贴
set clipboard=unnamed

" Vim 使用的Shell
" if IsUnix() || IsOsx()
"     set shell=bash
" elseif IsCygwin()
"     set shell=E:cygwininsh
" endif

"文件被外部的其它程序修改后自动在Vim加载
if exists("&autoread")
    set autoread
endif
"可以为不同模式分别打开鼠标:
if exists("&mouse")
    set mouse=a
endif
" 永远显示带有标签页标签的行
if exists("&showtabline")
    set showtabline=0
endif
" 缓冲区切换跳到第一个打开的包含指定缓冲区的窗口，也考虑其它标签页里的窗口
if v:version>=700
    set switchbuf=usetab
endif
" 是否自动改变当前工作目录的值
if v:version >= 703
    set noautochdir
endif

" 保存设置 viminfo 编辑会话信息
set viminfo='10,"100,:200,@200,%,n~/.viminfo
" 文件浏览器使用的目录:
set browsedir=current

" 写入已存在的文件前原文件是否备份
set nobackup
" 写入已存在的文件后是否删除原文件备份
set nowritebackup
" 缓冲区是否使用交换文件
set swapfile

" 执行宏,寄存器和其它不通过输入的命令时屏幕不会重画
" 另外,窗口标题的刷新也被推迟.要强迫刷新,使用":redraw"
set lazyredraw
" 放弃时隐藏保留修改了的缓冲区但不写回
set hidden
" 影响 <BS>,<Del>,CTRL-W 和 CTRL-U 在插入模式下的工作方式
set backspace=eol,start,indent

" 光标上下两侧最少保留的屏幕行数
set scrolloff=3
" 命令行补全以增强模式运行
set wildmenu
" 显示行号
set number
" 始终显示状态行
set laststatus=2
" 显示命令行消息行数
set cmdheight=2

" 错误信息静音
set noerrorbells
" 不使用可视响铃代替鸣叫
set novisualbell
" 不想要响铃也不想要闪烁
set t_vb=

"-------------------------------------------------------------------------
" 语言编码设置
"-------------------------------------------------------------------------"
" fileencodings：编码自动识别顺序
" encoding：内部使用的字符编码方式
" termencoding：用于屏幕显示的编码
" fileencoding：当前文件的编码，使用此编码保存文件
" 国语和其他多字节语言支持
"
if has("multi_byte")
    set fileencodings=ucs-bom,utf-8,chinese,taiwan,japan,korea,latin1
    if v:lang =~ "^zh_CN"
        set encoding=chinese
        set termencoding=chinese
        if &fileencoding == ''
            set fileencoding=chinese
        endif
    elseif v:lang =~ "^zh_TW"
        set encoding=taiwan
        set termencoding=taiwan
        if &fileencoding == ''
            set fileencoding=taiwan
        endif
    elseif v:lang =~ "^ja_JP"
        set encoding=japan
        set termencoding=japan
        if &fileencoding == ''
            set fileencoding=japan
        endif
    elseif v:lang =~ "^ko"
        set encoding=korea
        set termencoding=korea
        if &fileencoding == ''
            set fileencoding=korea
        endif
    endif

    " 使用utf-8设置
    if g:vim_encoding_utf8 || v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
        set encoding=utf-8
        set termencoding=utf-8
        if &fileencoding == ''
            set fileencoding=utf-8
        endif
    endif

    " 不要自动设置字节序标记
    set nobomb
else
    echoerr 'Sorry, this version of (g)Vim was not compiled with "multi_byte"'
endif
" 只有在 'encoding' 为 "utf-8" 或别的 Unicode 编码时才有效
" 告诉 Vim 怎么处理东亚二义性宽度字符类
if exists("&ambiwidth")
    set ambiwidth=double
endif

" 系统消息编码
if IsWindows()
    language messages zh_CN
else
    language messages zh_CN.UTF-8
endif

if has("gui_running")
    " 菜单编码
    set langmenu=zh_CN.UTF-8
    " 菜单乱码
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim
endif

" 中文帮助
if version >= 603
    set helplang=cn
endif

"-------------------------------------------------------------------------
" 插件管理器 Vundle
"-------------------------------------------------------------------------
" 关闭文件类型，Vundle必须
filetype off
" 设为 "dark" 时，Vim 试图使用深色背景上看起来舒服的颜色
" 设为 "light" 时，Vim 会试图使用在浅色背景上看起来舒服的颜色
set background=dark

" 装载插件配置文件
let bx_plugins_file = g:bx_vimsettings_path . 'bx_plugins.vim'
if filereadable(bx_plugins_file)
    exec 'source ' . bx_plugins_file
endif
unlet bx_plugins_file

" 打开文件类型
filetype on
if has("eval") && v:version>=600
    filetype plugin indent on
endif

"-------------------------------------------------------------------------
" 编辑
"-------------------------------------------------------------------------
"给出换行符(<EOL>)的格式
set fileformats=unix,dos,mac
" 不自动换行
"set nowrap
" 忽略大小写
set ignorecase
" 只包含小写字母时忽略大小写
set smartcase
" 搜索到文件两端时不重新搜索
set nowrapscan
" 输入搜索命令时,显示目前输入的模式的匹配位置.
set incsearch
" 有上一个搜索模式,高亮它的所有匹配
set hlsearch
" 模式字符解释方式
set magic
" 使用连接命令时，在 '.'、'?' 和 '!' 之后是否插入两个空格
set nojoinspaces
" 使指定的左右移动光标的键在行首或行尾可以移到前一行或者后一行
set whichwrap+=<,>
" 插入括号时,短暂地跳转到匹配的对应括号.只有在屏幕上能看到匹配时才会进
" 行跳转.显示匹配的时间用 "matchtime" 设置.
set showmatch
set matchtime=4
" 在 "breakat" 里的字符上,而不是在最后一个字符上回绕长行
set linebreak

" 缩进每一步使用的空白数目
set shiftwidth=4
" 文件里的 <Tab> 代表的空格数
set tabstop=4
" 插入模式里: 插入 <Tab> 时使用合适数量的空格
set expandtab
" 执行编辑操作,如插入 <Tab> 或者使用 <BS> 时,把 <Tab> 算作空格的数目.
set softtabstop=4
" 行首的 <Tab> 根据 "shiftwidth" 插入空白
set smarttab
" 显示 TAB 键
set list
" TAB会被显示成 ">---" ("-" 的个数不定) 而行尾多余的空白字符显示成 "*"。
set listchars=tab:>-,trail:*

" 启用自动缩进
set autoindent
" 开启新行的自动缩进
set smartindent
" 打开自动 C 程序的缩进
" if has("cindent")
"     set cindent
" endif

"高亮光标所在的屏幕行
if has("gui_running")
    if exists("&cursorline")
        set cursorline
    endif
endif

" 引号及括号
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

" 用于计算文件两个不同版本的 ed 风格的差异文件的表达式
set diffexpr=MyDiff()
function! MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

"-------------------------------------------------------------------------
" 语法
"-------------------------------------------------------------------------
" 打开语法高亮:
syntax on

" 开启折叠，设置折叠模式
if exists("&foldenable")
    set foldenable
    set foldmethod=indent
endif
" 设置代码折叠级别
if exists("&foldlevel")
    set foldlevel=0
endif

" HTML entities - used by xml edit plugin
let xml_use_xhtml = 1
"let xml_no_auto_nesting = 1

"To HTML
let html_use_css = 0
let html_number_lines = 0
let use_xhtml = 1


"-------------------------------------------------------------------------
" 加载配置文件
"-------------------------------------------------------------------------
" 私人配置
let bx_personal_file = g:bx_vimsettings_path . 'bx_personal.vim'
if filereadable(bx_personal_file)
    exec 'source ' . bx_personal_file
endif
unlet bx_personal_file

"-------------------------------------------------------------------------
" AutoCmd
"-------------------------------------------------------------------------
if has("autocmd")
    augroup bx
        autocmd!

        autocmd BufNewFile,BufRead *.go set filetype=go
        autocmd BufNewFile,BufRead *.js,*.htc,*.c,*.tmpl,*.css inoremap $c /**<CR> **/<esc>O
        " 补全
        "autocmd FileType php set omnifunc=phpcomplete#CompletePHP
        "autocmd FileType python set omnifunc=pythoncomplete#Complete
        autocmd FileType python3 set omnifunc=python3complete#Complete
        autocmd FileType c set omnifunc=ccomplete#Complete
        autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
        autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
        autocmd FileType css set omnifunc=csscomplete#CompleteCSS
        autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS

        "autocmd FileType go autocmd BufWritePre <buffer> Fmt
        autocmd FileType go compiler go
    augroup end
endif

"-------------------------------------------------------------------------
" GUI 窗口设置
"-------------------------------------------------------------------------
if has("gui_running")
    "set guioptions-=m   " 关闭菜单栏
    set guioptions-=T   " 关闭工具栏
    set guioptions-=l   " 关闭左边滚动条
    set guioptions-=L   " 关闭垂直分隔窗口左边滚动条
    "set guioptions-=r   " 关闭右边滚动条
    "set guioptions-=R   " 关闭垂直分隔窗口右边滚动条
 
    if IsWindows()
        "这个选项是模拟弹出菜单中使用最大化的快捷键 "x"
        if has("autocmd")
            autocmd GUIEnter * simalt ~x
        endif
    else
        if exists('+lines')
            set lines=40
        endif
        if exists('+columns')
            set columns=130
        endif
    endif
endif

" 字体
if IsWindows()
    set guifont=Consolas:h14
else
    set guifont=Consolas\ 14
endif
