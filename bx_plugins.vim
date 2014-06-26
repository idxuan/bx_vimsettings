"======================================================================
"     FileName: bx_plugins.vim
"         Desc: VIM 插件管理器
"       Author: Jun Xuan (idxuan@hotmail.com)
"         Link: http://idxuan.github.io
"      Version: 0.2.1
"   LastChange: 2014-05-23 21:53:56
"      History:
"======================================================================

"----------------------------------------------------------------------
" Vundle 插件管理器
"----------------------------------------------------------------------
" :PluginList     列出已经安装的插件
" :PluginInstall  安装所有配置文件中的插件
" :PluginInstall! 更新所有插件
"
" :PluginUpdate   更新所有插件
" :PluginSearch   搜索插件
" :PluginClean!   根据配置文件删除插件
"
" set the runtime path to include Vundle and initialize
call vundle#rc(g:plugin_bundle_path)
" let Vundle manage Vundle, required
Plugin 'gmarik/vundle'

"----------------------------------------------------------------------
" Vim 中文帮助
"----------------------------------------------------------------------
Plugin 'file://' . g:plugin_bundle_path . 'bx_vimcdoc'

"----------------------------------------------------------------------
" Theme 主题
"----------------------------------------------------------------------
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'

"if !has("gui_running")
"    let g:solarized_termcolors=256
"endif

if v:version > 601
    colorscheme solarized
    "colorscheme molokai
endif

"----------------------------------------------------------------------
" PowerLine 状态栏
"----------------------------------------------------------------------
Plugin 'Lokaltog/vim-powerline'

"----------------------------------------------------------------------
" Indent-Guides 缩进
"----------------------------------------------------------------------
Plugin 'nathanaelkane/vim-indent-guides'

"----------------------------------------------------------------------
" FencView 自动识别文件的编码格式
"----------------------------------------------------------------------
"Plugin 'FencView.vim'
"let g:fencview_autodetect=1 " fencview 自动检测每个文件
"
"----------------------------------------------------------------------
" VimIM_Dict 字典输入
"----------------------------------------------------------------------
" 插件开发中，你可以注释它等待开发完成后你可以取消注释使用原生插件
"Plugin 'idxuanjun/bx_vimim_dict'
Plugin 'file://' . g:plugin_bundle_path . 'bx_vimim_dict'

"----------------------------------------------------------------------
" CtrlP 文件，缓冲区，最近文件管理 pf pb pm
"----------------------------------------------------------------------
Plugin 'ctrlp.vim'

let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_by_filename = 1
let g:ctrlp_map = '<F2>'
noremap <silent><C-F2> <ESC>:CtrlPBuffer<CR>
noremap <silent><S-F2> <ESC>:CtrlPMRU<CR>

"----------------------------------------------------------------------
" NerdTree 文件管理
"----------------------------------------------------------------------
Plugin 'scrooloose/nerdtree'

" 装饰
let g:NERDChristmasTree=1
" 控制当光标移动超过一定距离时，是否自动将焦点调整到屏中心
let g:NERDTreeAutoCenter=1
" 指定书签文件
let g:NERDTreeBookmarksFile=g:bx_data_path . 'NerdBookmarks.txt'
" 指定鼠标模式（1.双击打开；2.单目录双文件；3.单击打开）
let g:NERDTreeMouseMode=2
" 是否默认显示书签列表
let g:NERDTreeShowBookmarks=1
" 是否默认显示文件
let g:NERDTreeShowFiles=1
" 是否默认显示隐藏文件
let g:NERDTreeShowHidden=0
" 是否默认显示行号
let NERDTreeShowLineNumbers=1
" NerdTree自动更改到当前目录
let g:NERDTreeChDirMode=1
" NerdTree窗口位置
let g:NERDTreeWinPos='left'
" NerdTree子窗口宽度
let g:NERDTreeWinSize=35
" <F2>打开NerdTree窗口，在左侧栏显示
noremap <silent> <F3> :NERDTreeToggle<CR>

"----------------------------------------------------------------------
" Buffer Explorer 缓冲区管理
"----------------------------------------------------------------------
"Plugin 'bufexplorer.zip'

"let g:bufExplorerDisableDefaultKeyMapping=1
" 打开BufExplorer窗口，全屏
"noremap <silent><S-F3> <ESC>:BufExplorer<CR>
" 打开BufExplorer窗口，上下分割
"noremap <silent><S-F3> <ESC>:BufExplorerHorizontalSplit<CR>
" 打开BufExplorer窗口，左右分割
"noremap <silent><S-F3> <ESC>:BufExplorerVerticalSplit<CR>

"----------------------------------------------------------------------
" FavEx 目录和文件收藏
"----------------------------------------------------------------------
Plugin 'FavEx'

"----------------------------------------------------------------------
" NerdCommenter 注释 pc
"----------------------------------------------------------------------
Plugin 'scrooloose/nerdcommenter'

" 一步加载语法模板和作者、时间信息
nnoremap <silent><Leader>pc :LoadTemplate<CR><ESC>:AuthorInfoDetect<CR><ESC>

"----------------------------------------------------------------------
" load_template 加载文件模板
"----------------------------------------------------------------------
Plugin 'load_template'

let g:template_path=g:vimfiles_path . 'bundle/load_template/template/'

"----------------------------------------------------------------------
" AuthorInfo 自动生成/更新文件的作者信息
"----------------------------------------------------------------------
" 修改插件以符合自己使用，你可以取消注释使用原生插件
"Plugin 'AuthorInfo'
Plugin 'file://' . g:plugin_bundle_path . 'AuthorInfo'

" Vundle 无法装载 AuthorInfo，手工载入
if !exists('g:loaded_authorinfo')
    let plugin_auth_file = g:plugin_bundle_path . 'AuthorInfo/ftplugin/authorinfo.vim'
    if filereadable(plugin_auth_file)
        exec 'source ' . plugin_auth_file
    endif
    unlet plugin_auth_file
endif

let g:vimrc_author='Jun Xuan'
let g:vimrc_email='idxuan@hotmail.com'
let g:vimrc_homepage='http://idxuan.github.io'

"----------------------------------------------------------------------
" snipMate 自动补全
"----------------------------------------------------------------------
Plugin 'snipMate'

"ino <c-j> <c-r>=TriggerSnippet()<cr>
"snor <c-j> <esc>i<right><c-r>=TriggerSnippet()<cr>
let g:snips_author='Jun Xuan'
"----------------------------------------------------------------------
" Tagbar 标签函数
"----------------------------------------------------------------------
Plugin 'Tagbar'

" <F5> 打开关闭Tagbar窗口，在右侧栏显示   [非插入模式]
nnoremap <silent><F5> :TagbarToggle<CR>

"设置宽度，默认为30
let g:tagbar_width = 30
" Tagbar窗口放在右侧
let g:tagbar_right = 1
" Tagbar打开后自动获得焦点
let g:tagbar_autofocus = 1

"增加tagbar对golang的支持
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }
"增加tagbar对markdown的支持
let g:tagbar_type_markdown = {
    \ 'ctagstype' : 'markdown',
    \ 'kinds' : [
        \ 'h:Heading_L1',
        \ 'i:Heading_L2',
        \ 'k:Heading_L3'
    \ ]
\ }
"增加tagbar对markdown的支持
let g:tagbar_type_ruby = {
    \ 'kinds' : [
        \ 'm:modules',
        \ 'c:classes',
        \ 'd:describes',
        \ 'C:contexts',
        \ 'f:methods',
        \ 'F:singleton methods'
    \ ]
\ }
"----------------------------------------------------------------------
" skammer/vim-css-color
"----------------------------------------------------------------------
Plugin 'skammer/vim-css-color'
let g:cssColorVimDoNotMessMyUpdatetime=1

"----------------------------------------------------------------------
" Markdown pm
"----------------------------------------------------------------------
Plugin 'plasticboy/vim-markdown'

let g:vim_markdown_folding_disabled=0
let g:vim_markdown_initial_foldlevel=0

"----------------------------------------------------------------------
" GoLang
"----------------------------------------------------------------------
Plugin 'jnwhiteh/vim-golang'

if exists($GOROOT)
    set runtimepath+=$GOROOT/misc/vim
endif

"----------------------------------------------------------------------
" Pydiction Python插件
"----------------------------------------------------------------------
" GoLang
"----------------------------------------------------------------------
Plugin 'rkulla/pydiction'

let g:pydiction_location=g:plugin_bundle_path . 'pydiction/complete-dict'
let g:pydiction_menu_height=15

"----------------------------------------------------------------------
"Plugin 'jnwhiteh/vim-golang'

"----------------------------------------------------------------------
" ruby
"----------------------------------------------------------------------
"Plugin 'vim-ruby/vim-ruby'

"----------------------------------------------------------------------
" syntastic 语法检查
"----------------------------------------------------------------------
Plugin 'scrooloose/syntastic'

let g:syntastic_check_on_open=1
let g:syntastic_aggregate_errors=1
let g:syntastic_enable_balloons=1
"let g:syntastic_auto_jump=2
" Python 的语法检查使用 Pylint，未安装的注释本设置
let g:syntastic_python_checkers=['pylint']
let g:syntastic_error_symbol='xx'
let g:syntastic_warning_symbol='>>'

